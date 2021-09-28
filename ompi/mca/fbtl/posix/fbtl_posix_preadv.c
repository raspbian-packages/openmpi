/*
 * Copyright (c) 2004-2005 The Trustees of Indiana University and Indiana
 *                         University Research and Technology
 *                         Corporation.  All rights reserved.
 * Copyright (c) 2004-2011 The University of Tennessee and The University
 *                         of Tennessee Research Foundation.  All rights
 *                         reserved.
 * Copyright (c) 2004-2005 High Performance Computing Center Stuttgart,
 *                         University of Stuttgart.  All rights reserved.
 * Copyright (c) 2004-2005 The Regents of the University of California.
 *                         All rights reserved.
 * Copyright (c) 2008-2020 University of Houston. All rights reserved.
 * Copyright (c) 2015-2018 Research Organization for Information Science
 *                         and Technology (RIST). All rights reserved.
 * $COPYRIGHT$
 *
 * Additional copyrights may follow
 *
 * $HEADER$
 */

#include "ompi_config.h"
#include "fbtl_posix.h"

#include "mpi.h"
#include <unistd.h>
#include <limits.h>
#include "ompi/constants.h"
#include "ompi/mca/fbtl/fbtl.h"


static ssize_t mca_fbtl_posix_preadv_datasieving (ompio_file_t *fh);
static ssize_t mca_fbtl_posix_preadv_generic (ompio_file_t *fh);

#ifndef IOV_MAX
#define IOV_MAX 1024
#endif

ssize_t mca_fbtl_posix_preadv (ompio_file_t *fh )
{
    ssize_t bytes_read=0, ret_code=0;
    struct flock lock;
    int ret;

    if (NULL == fh->f_io_array) {
        return OMPI_ERROR;
    }
    
    if ( fh->f_num_of_io_entries > 1 ) {
        bool do_data_sieving = true;

        size_t avg_gap_size=0;
        size_t avg_block_size = 0;
        off_t prev_offset = (off_t)fh->f_io_array[0].offset;
        int i;
        for ( i=0; i< fh->f_num_of_io_entries; i++ ) {
            avg_block_size += fh->f_io_array[i].length;
            avg_gap_size   += (size_t)((off_t)fh->f_io_array[i].offset - prev_offset);
            prev_offset     = (off_t)fh->f_io_array[i].offset;
        }
        avg_block_size = avg_block_size / fh->f_num_of_io_entries;
        avg_gap_size = avg_gap_size / fh->f_num_of_io_entries;

        if ( false == mca_fbtl_posix_read_datasieving       ||
             0     == avg_gap_size                          ||
             avg_block_size > mca_fbtl_posix_max_block_size ||
             avg_gap_size   > mca_fbtl_posix_max_gap_size     ) {
            do_data_sieving = false;
        }

        if ( do_data_sieving) {
            return mca_fbtl_posix_preadv_datasieving (fh);
        }
        else {
            return mca_fbtl_posix_preadv_generic (fh);
        }
    }
    else {
        // i.e. fh->f_num_of_io_entries == 1
        ret = mca_fbtl_posix_lock ( &lock, fh, F_RDLCK, (off_t)fh->f_io_array[0].offset,
                                    (off_t)fh->f_io_array[0].length, OMPIO_LOCK_ENTIRE_REGION ); 
        if ( 0 < ret ) {
            opal_output(1, "mca_fbtl_posix_preadv: error in mca_fbtl_posix_lock() ret=%d: %s",
                        ret, strerror(errno));
            /* Just in case some part of the lock worked */
            mca_fbtl_posix_unlock ( &lock, fh);
            return OMPI_ERROR;
        }
        
        ret_code = pread(fh->fd, fh->f_io_array[0].memory_address, fh->f_io_array[0].length,
                         (off_t)fh->f_io_array[0].offset );
        mca_fbtl_posix_unlock ( &lock, fh );
        if ( ret_code == -1 ) {
            opal_output(1, "mca_fbtl_posix_preadv: error in (p)read(v):%s", strerror(errno));
	    return OMPI_ERROR;
	}
        
        bytes_read += ret_code;
    }
        
    return bytes_read;
}

ssize_t mca_fbtl_posix_preadv_datasieving (ompio_file_t *fh)
{
    size_t start, end, len;
    size_t bufsize = 0;
    int ret, i, j;
    ssize_t bytes_read=0, ret_code=0;
    struct flock lock;
    char *temp_buf = NULL;
    
    int startindex = 0;
    int endindex   = 0;
    bool done = false;
    
    while (!done) {
        // Break the io_array into chunks such that the size of the temporary
        // buffer does not exceed mca_fbtl_posix_max_tmpbuf_size bytes.
        // Each iteration will thus work in the range (startindex, endindex[
        startindex = endindex;
        if ( startindex >= fh->f_num_of_io_entries  ) {
            done = true;
            break;
        }
        
        size_t sstart = (size_t)fh->f_io_array[startindex].offset;
        size_t slen=0;

        for ( j = startindex; j < fh->f_num_of_io_entries; j++ ) {
            endindex = j;
            slen = ((size_t)fh->f_io_array[j].offset + fh->f_io_array[j].length) - sstart;            
            if (slen > mca_fbtl_posix_max_tmpbuf_size ) {
                endindex = j-1;
                break;
            }
        }
        // Need to increment the value of endindex
        // by one for the loop syntax to work correctly.
        endindex++;
        
        start = (size_t)fh->f_io_array[startindex].offset;
        end   = (size_t)fh->f_io_array[endindex-1].offset + fh->f_io_array[endindex-1].length;
        len   = end - start;
        
        if ( len > bufsize ) {
            if ( NULL != temp_buf ) {
                free ( temp_buf);
            }
            temp_buf = (char *) malloc ( len );
            if ( NULL == temp_buf ) {
                opal_output(1, "OUT OF MEMORY\n");
                return OMPI_ERR_OUT_OF_RESOURCE;
            }
            bufsize = len;
        }
        
        // Read the entire block.
        ret = mca_fbtl_posix_lock ( &lock, fh, F_RDLCK, start, len, OMPIO_LOCK_ENTIRE_REGION ); 
        if ( 0 < ret ) {
            opal_output(1, "mca_fbtl_posix_preadv_datasieving: error in mca_fbtl_posix_lock() ret=%d: %s",
                        ret, strerror(errno));
            /* Just in case some part of the lock worked */
            mca_fbtl_posix_unlock ( &lock, fh);
            free ( temp_buf);
            return OMPI_ERROR;
        }
        
        ret_code = pread (fh->fd, temp_buf, len, start);
        mca_fbtl_posix_unlock ( &lock, fh);
        if ( ret_code == -1 ) {
            opal_output(1, "mca_fbtl_posix_preadv_datasieving: error in (p)read(v):%s", strerror(errno));
            free ( temp_buf);
            return OMPI_ERROR;
        }
        
        // Copy out the elements that were requested.
        size_t pos = 0;
        size_t num_bytes;
        size_t start_offset = (size_t) fh->f_io_array[startindex].offset;
        for ( i = startindex ; i < endindex ; i++) {
            pos = (size_t) fh->f_io_array[i].offset - start_offset;
            if ( (ssize_t) pos > ret_code ) {
                break;
            }
            num_bytes = fh->f_io_array[i].length;
            if ( ((ssize_t) pos + (ssize_t)num_bytes) > ret_code ) {
                num_bytes = ret_code - (ssize_t)pos;
            }
            
            memcpy (fh->f_io_array[i].memory_address, temp_buf + pos, num_bytes);
            bytes_read += num_bytes;            
        }
    }
    
    free ( temp_buf);
    return bytes_read;
}

ssize_t mca_fbtl_posix_preadv_generic (ompio_file_t *fh )
{
    ssize_t bytes_read=0, ret_code=0;
    struct iovec *iov = NULL;
    struct flock lock;
    int ret, i;

    int block=1;
    int iov_count = 0;
    OMPI_MPI_OFFSET_TYPE iov_offset = 0;
    off_t total_length, end_offset=0;
    
    iov = (struct iovec *) malloc (OMPIO_IOVEC_INITIAL_SIZE * sizeof (struct iovec));
    if (NULL == iov) {
        opal_output(1, "OUT OF MEMORY\n");
        return OMPI_ERR_OUT_OF_RESOURCE;
    }
    
    for (i=0 ; i<fh->f_num_of_io_entries ; i++) {
        if (0 == iov_count) {
            iov[iov_count].iov_base = fh->f_io_array[i].memory_address;
            iov[iov_count].iov_len = fh->f_io_array[i].length;
            iov_offset = (OMPI_MPI_OFFSET_TYPE)(intptr_t)fh->f_io_array[i].offset;
            end_offset = (off_t)fh->f_io_array[i].offset + (off_t)fh->f_io_array[i].length;
            iov_count ++;
        }
        
        if (OMPIO_IOVEC_INITIAL_SIZE*block <= iov_count) {
            block ++;
            iov = (struct iovec *)realloc
                (iov, OMPIO_IOVEC_INITIAL_SIZE * block *
                 sizeof(struct iovec));
            if (NULL == iov) {
                opal_output(1, "OUT OF MEMORY\n");
                return OMPI_ERR_OUT_OF_RESOURCE;
            }
        }
        
        if (fh->f_num_of_io_entries != i+1) {
            if (((((OMPI_MPI_OFFSET_TYPE)(intptr_t)fh->f_io_array[i].offset +
                   (ptrdiff_t)fh->f_io_array[i].length) ==
                  (OMPI_MPI_OFFSET_TYPE)(intptr_t)fh->f_io_array[i+1].offset)) &&
                (iov_count < IOV_MAX ) ){
                iov[iov_count].iov_base =
                    fh->f_io_array[i+1].memory_address;
                iov[iov_count].iov_len = fh->f_io_array[i+1].length;
                end_offset = (off_t)fh->f_io_array[i].offset + (off_t)fh->f_io_array[i].length;
                iov_count ++;
                continue;
            }
        }
        
        total_length = (end_offset - (off_t)iov_offset );
        
        ret = mca_fbtl_posix_lock ( &lock, fh, F_RDLCK, iov_offset, total_length, OMPIO_LOCK_SELECTIVE ); 
        if ( 0 < ret ) {
            opal_output(1, "mca_fbtl_posix_preadv_generic: error in mca_fbtl_posix_lock() ret=%d: %s", ret, strerror(errno));
            free (iov);
            /* Just in case some part of the lock worked */
            mca_fbtl_posix_unlock ( &lock, fh);
            return OMPI_ERROR;
        }
#if defined(HAVE_PREADV)
        ret_code = preadv (fh->fd, iov, iov_count, iov_offset);
#else
        if (-1 == lseek (fh->fd, iov_offset, SEEK_SET)) {
            opal_output(1, "mca_fbtl_posix_preadv_generic: error in lseek:%s", strerror(errno));
            free(iov);
            mca_fbtl_posix_unlock ( &lock, fh );
            return OMPI_ERROR;
        }
        ret_code = readv (fh->fd, iov, iov_count);
#endif
        mca_fbtl_posix_unlock ( &lock, fh );
        if ( 0 < ret_code ) {
            bytes_read+=ret_code;
        }
        else if ( ret_code == -1 ) {
            opal_output(1, "mca_fbtl_posix_preadv_generic: error in (p)readv:%s", strerror(errno));
            free(iov);
            return OMPI_ERROR;
        }
        else if ( 0 == ret_code ){
            /* end of file reached, no point in continue reading; */
            break;
        }
        iov_count = 0;
    }   

    free (iov);
    return bytes_read;
}
