dnl
dnl $HEADER$
dnl
dnl ---------------------------------------------------------------------------
dnl This file is automatically created by autogen.pl; it should not
dnl be edited by hand!!
dnl
dnl Generated by rhc at Fri Sep  2 13:04:21 2016
dnl on rhc001.
dnl ---------------------------------------------------------------------------

dnl Platform file
m4_define([autogen_platform_file], [])

dnl Separate m4 define for each project
m4_define([project_opal], [1])
m4_define([project_orte], [1])
m4_define([project_ompi], [1])
m4_define([project_oshmem], [1])

dnl Project names
m4_define([project_name_long], [Open MPI])
m4_define([project_name_short], [openmpi])

dnl List of MCA projects found by autogen.pl
m4_define([mca_project_list], [opal, orte, ompi, oshmem])

dnl ---------------------------------------------------------------------------
dnl ---------------------------------------------------------------------------
dnl ---------------------------------------------------------------------------

dnl MCA information
dnl ---------------------------------------------------------------------------

dnl Frameworks in the opal project and their corresponding directories
m4_define([mca_opal_framework_list], [common, allocator, backtrace, btl, dl, event, hwloc, if, installdirs, memchecker, memcpy, memory, mpool, patcher, pmix, pstat, rcache, sec, shmem, timer])

dnl Components in the opal / common framework
m4_define([mca_opal_common_m4_config_component_list], [cuda, libfabric, sm, ugni, verbs, verbs_usnic])
m4_define([mca_opal_common_no_config_component_list], [])

dnl Components in the opal / allocator framework
m4_define([mca_opal_allocator_m4_config_component_list], [])
m4_define([mca_opal_allocator_no_config_component_list], [basic, bucket])

dnl Components in the opal / backtrace framework
m4_define([mca_opal_backtrace_m4_config_component_list], [execinfo, none, printstack])
m4_define([mca_opal_backtrace_no_config_component_list], [])

dnl Components in the opal / btl framework
m4_define([mca_opal_btl_m4_config_component_list], [openib, portals4, scif, sm, smcuda, tcp, ugni, usnic, vader])
m4_define([mca_opal_btl_no_config_component_list], [self])

dnl Components in the opal / dl framework
m4_define([mca_opal_dl_m4_config_component_list], [dlopen, libltdl])
m4_define([mca_opal_dl_no_config_component_list], [])

dnl Components in the opal / event framework
m4_define([mca_opal_event_m4_config_component_list], [external, libevent2022])
m4_define([mca_opal_event_no_config_component_list], [])

dnl Components in the opal / hwloc framework
m4_define([mca_opal_hwloc_m4_config_component_list], [external, hwloc1112])
m4_define([mca_opal_hwloc_no_config_component_list], [])

dnl Components in the opal / if framework
m4_define([mca_opal_if_m4_config_component_list], [bsdx_ipv4, bsdx_ipv6, linux_ipv6, posix_ipv4, solaris_ipv6])
m4_define([mca_opal_if_no_config_component_list], [])

dnl Components in the opal / installdirs framework
m4_define([mca_opal_installdirs_m4_config_component_list], [config, env])
m4_define([mca_opal_installdirs_no_config_component_list], [])

dnl Components in the opal / memchecker framework
m4_define([mca_opal_memchecker_m4_config_component_list], [valgrind])
m4_define([mca_opal_memchecker_no_config_component_list], [])

dnl Components in the opal / memcpy framework
m4_define([mca_opal_memcpy_m4_config_component_list], [])
m4_define([mca_opal_memcpy_no_config_component_list], [])

dnl Components in the opal / memory framework
m4_define([mca_opal_memory_m4_config_component_list], [linux, malloc_solaris, patcher])
m4_define([mca_opal_memory_no_config_component_list], [])

dnl Components in the opal / mpool framework
m4_define([mca_opal_mpool_m4_config_component_list], [gpusm, rgpusm, udreg])
m4_define([mca_opal_mpool_no_config_component_list], [grdma, sm])

dnl Components in the opal / patcher framework
m4_define([mca_opal_patcher_m4_config_component_list], [overwrite])
m4_define([mca_opal_patcher_no_config_component_list], [])

dnl Components in the opal / pmix framework
m4_define([mca_opal_pmix_m4_config_component_list], [cray, external, pmix112, s1, s2])
m4_define([mca_opal_pmix_no_config_component_list], [])

dnl Components in the opal / pstat framework
m4_define([mca_opal_pstat_m4_config_component_list], [linux, test])
m4_define([mca_opal_pstat_no_config_component_list], [])

dnl Components in the opal / rcache framework
m4_define([mca_opal_rcache_m4_config_component_list], [])
m4_define([mca_opal_rcache_no_config_component_list], [vma])

dnl Components in the opal / sec framework
m4_define([mca_opal_sec_m4_config_component_list], [keystone, munge])
m4_define([mca_opal_sec_no_config_component_list], [basic])

dnl Components in the opal / shmem framework
m4_define([mca_opal_shmem_m4_config_component_list], [mmap, posix, sysv])
m4_define([mca_opal_shmem_no_config_component_list], [])

dnl Components in the opal / timer framework
m4_define([mca_opal_timer_m4_config_component_list], [altix, darwin, linux, solaris])
m4_define([mca_opal_timer_no_config_component_list], [])

dnl ---------------------------------------------------------------------------

dnl Frameworks in the orte project and their corresponding directories
m4_define([mca_orte_framework_list], [common, dfs, errmgr, ess, filem, grpcomm, iof, notifier, odls, oob, plm, ras, rmaps, rml, routed, rtc, schizo, state])

dnl Components in the orte / common framework
m4_define([mca_orte_common_m4_config_component_list], [alps])
m4_define([mca_orte_common_no_config_component_list], [])

dnl Components in the orte / dfs framework
m4_define([mca_orte_dfs_m4_config_component_list], [])
m4_define([mca_orte_dfs_no_config_component_list], [app, orted, test])

dnl Components in the orte / errmgr framework
m4_define([mca_orte_errmgr_m4_config_component_list], [])
m4_define([mca_orte_errmgr_no_config_component_list], [default_app, default_hnp, default_orted, default_tool])

dnl Components in the orte / ess framework
m4_define([mca_orte_ess_m4_config_component_list], [alps, lsf, slurm, tm])
m4_define([mca_orte_ess_no_config_component_list], [env, hnp, pmi, singleton, tool])

dnl Components in the orte / filem framework
m4_define([mca_orte_filem_m4_config_component_list], [])
m4_define([mca_orte_filem_no_config_component_list], [raw])

dnl Components in the orte / grpcomm framework
m4_define([mca_orte_grpcomm_m4_config_component_list], [])
m4_define([mca_orte_grpcomm_no_config_component_list], [direct])

dnl Components in the orte / iof framework
m4_define([mca_orte_iof_m4_config_component_list], [])
m4_define([mca_orte_iof_no_config_component_list], [hnp, mr_hnp, mr_orted, orted, tool])

dnl Components in the orte / notifier framework
m4_define([mca_orte_notifier_m4_config_component_list], [])
m4_define([mca_orte_notifier_no_config_component_list], [syslog])

dnl Components in the orte / odls framework
m4_define([mca_orte_odls_m4_config_component_list], [alps, default])
m4_define([mca_orte_odls_no_config_component_list], [])

dnl Components in the orte / oob framework
m4_define([mca_orte_oob_m4_config_component_list], [alps, tcp, ud, usock])
m4_define([mca_orte_oob_no_config_component_list], [])

dnl Components in the orte / plm framework
m4_define([mca_orte_plm_m4_config_component_list], [alps, isolated, lsf, rsh, slurm, tm])
m4_define([mca_orte_plm_no_config_component_list], [])

dnl Components in the orte / ras framework
m4_define([mca_orte_ras_m4_config_component_list], [alps, gridengine, loadleveler, lsf, slurm, tm])
m4_define([mca_orte_ras_no_config_component_list], [simulator])

dnl Components in the orte / rmaps framework
m4_define([mca_orte_rmaps_m4_config_component_list], [])
m4_define([mca_orte_rmaps_no_config_component_list], [mindist, ppr, rank_file, resilient, round_robin, seq, staged])

dnl Components in the orte / rml framework
m4_define([mca_orte_rml_m4_config_component_list], [ftrm])
m4_define([mca_orte_rml_no_config_component_list], [oob])

dnl Components in the orte / routed framework
m4_define([mca_orte_routed_m4_config_component_list], [])
m4_define([mca_orte_routed_no_config_component_list], [binomial, debruijn, direct, radix])

dnl Components in the orte / rtc framework
m4_define([mca_orte_rtc_m4_config_component_list], [freq])
m4_define([mca_orte_rtc_no_config_component_list], [hwloc])

dnl Components in the orte / schizo framework
m4_define([mca_orte_schizo_m4_config_component_list], [])
m4_define([mca_orte_schizo_no_config_component_list], [ompi])

dnl Components in the orte / state framework
m4_define([mca_orte_state_m4_config_component_list], [])
m4_define([mca_orte_state_no_config_component_list], [app, dvm, hnp, novm, orted, staged_hnp, staged_orted, tool])

dnl ---------------------------------------------------------------------------

dnl Frameworks in the ompi project and their corresponding directories
m4_define([mca_ompi_framework_list], [common, bml, coll, fbtl, fcoll, fs, io, mtl, op, osc, pml, rte, sharedfp, topo, vprotocol])

dnl Components in the ompi / common framework
m4_define([mca_ompi_common_m4_config_component_list], [])
m4_define([mca_ompi_common_no_config_component_list], [])

dnl Components in the ompi / bml framework
m4_define([mca_ompi_bml_m4_config_component_list], [r2])
m4_define([mca_ompi_bml_no_config_component_list], [])

dnl Components in the ompi / coll framework
m4_define([mca_ompi_coll_m4_config_component_list], [cuda, fca, hcoll, portals4])
m4_define([mca_ompi_coll_no_config_component_list], [basic, inter, libnbc, self, sm, tuned])

dnl Components in the ompi / fbtl framework
m4_define([mca_ompi_fbtl_m4_config_component_list], [plfs, posix, pvfs2])
m4_define([mca_ompi_fbtl_no_config_component_list], [])

dnl Components in the ompi / fcoll framework
m4_define([mca_ompi_fcoll_m4_config_component_list], [])
m4_define([mca_ompi_fcoll_no_config_component_list], [dynamic, individual, static, two_phase])

dnl Components in the ompi / fs framework
m4_define([mca_ompi_fs_m4_config_component_list], [lustre, plfs, pvfs2])
m4_define([mca_ompi_fs_no_config_component_list], [ufs])

dnl Components in the ompi / io framework
m4_define([mca_ompi_io_m4_config_component_list], [romio314])
m4_define([mca_ompi_io_no_config_component_list], [ompio])

dnl Components in the ompi / mtl framework
m4_define([mca_ompi_mtl_m4_config_component_list], [mxm, ofi, portals4, psm, psm2])
m4_define([mca_ompi_mtl_no_config_component_list], [])

dnl Components in the ompi / op framework
m4_define([mca_ompi_op_m4_config_component_list], [])
m4_define([mca_ompi_op_no_config_component_list], [])

dnl Components in the ompi / osc framework
m4_define([mca_ompi_osc_m4_config_component_list], [portals4, pt2pt, rdma])
m4_define([mca_ompi_osc_no_config_component_list], [sm])

dnl Components in the ompi / pml framework
m4_define([mca_ompi_pml_m4_config_component_list], [ob1, ucx, v, yalla])
m4_define([mca_ompi_pml_no_config_component_list], [cm])

dnl Components in the ompi / rte framework
m4_define([mca_ompi_rte_m4_config_component_list], [orte])
m4_define([mca_ompi_rte_no_config_component_list], [])

dnl Components in the ompi / sharedfp framework
m4_define([mca_ompi_sharedfp_m4_config_component_list], [sm])
m4_define([mca_ompi_sharedfp_no_config_component_list], [individual, lockedfile])

dnl Components in the ompi / topo framework
m4_define([mca_ompi_topo_m4_config_component_list], [])
m4_define([mca_ompi_topo_no_config_component_list], [basic])

dnl Components in the ompi / vprotocol framework
m4_define([mca_ompi_vprotocol_m4_config_component_list], [])
m4_define([mca_ompi_vprotocol_no_config_component_list], [pessimist])

dnl ---------------------------------------------------------------------------

dnl Frameworks in the oshmem project and their corresponding directories
m4_define([mca_oshmem_framework_list], [atomic, memheap, scoll, spml, sshmem])

dnl Components in the oshmem / atomic framework
m4_define([mca_oshmem_atomic_m4_config_component_list], [mxm, ucx])
m4_define([mca_oshmem_atomic_no_config_component_list], [basic])

dnl Components in the oshmem / memheap framework
m4_define([mca_oshmem_memheap_m4_config_component_list], [])
m4_define([mca_oshmem_memheap_no_config_component_list], [buddy, ptmalloc])

dnl Components in the oshmem / scoll framework
m4_define([mca_oshmem_scoll_m4_config_component_list], [fca])
m4_define([mca_oshmem_scoll_no_config_component_list], [basic, mpi])

dnl Components in the oshmem / spml framework
m4_define([mca_oshmem_spml_m4_config_component_list], [ikrit, ucx])
m4_define([mca_oshmem_spml_no_config_component_list], [yoda])

dnl Components in the oshmem / sshmem framework
m4_define([mca_oshmem_sshmem_m4_config_component_list], [mmap, sysv, verbs])
m4_define([mca_oshmem_sshmem_no_config_component_list], [])

dnl ---------------------------------------------------------------------------

dnl List of configure.m4 files to include
m4_include([opal/mca/backtrace/configure.m4])
m4_include([opal/mca/dl/configure.m4])
m4_include([opal/mca/event/configure.m4])
m4_include([opal/mca/hwloc/configure.m4])
m4_include([opal/mca/installdirs/configure.m4])
m4_include([opal/mca/memchecker/configure.m4])
m4_include([opal/mca/memcpy/configure.m4])
m4_include([opal/mca/memory/configure.m4])
m4_include([opal/mca/pstat/configure.m4])
m4_include([opal/mca/timer/configure.m4])
m4_include([opal/mca/common/cuda/configure.m4])
m4_include([opal/mca/common/libfabric/configure.m4])
m4_include([opal/mca/common/sm/configure.m4])
m4_include([opal/mca/common/ugni/configure.m4])
m4_include([opal/mca/common/verbs/configure.m4])
m4_include([opal/mca/common/verbs_usnic/configure.m4])
m4_include([opal/mca/backtrace/execinfo/configure.m4])
m4_include([opal/mca/backtrace/none/configure.m4])
m4_include([opal/mca/backtrace/printstack/configure.m4])
m4_include([opal/mca/btl/openib/configure.m4])
m4_include([opal/mca/btl/portals4/configure.m4])
m4_include([opal/mca/btl/scif/configure.m4])
m4_include([opal/mca/btl/sm/configure.m4])
m4_include([opal/mca/btl/smcuda/configure.m4])
m4_include([opal/mca/btl/tcp/configure.m4])
m4_include([opal/mca/btl/ugni/configure.m4])
m4_include([opal/mca/btl/usnic/configure.m4])
m4_include([opal/mca/btl/vader/configure.m4])
m4_include([opal/mca/dl/dlopen/configure.m4])
m4_include([opal/mca/dl/libltdl/configure.m4])
m4_include([opal/mca/event/external/configure.m4])
m4_include([opal/mca/event/libevent2022/configure.m4])
m4_include([opal/mca/hwloc/external/configure.m4])
m4_include([opal/mca/hwloc/hwloc1112/configure.m4])
m4_include([opal/mca/if/bsdx_ipv4/configure.m4])
m4_include([opal/mca/if/bsdx_ipv6/configure.m4])
m4_include([opal/mca/if/linux_ipv6/configure.m4])
m4_include([opal/mca/if/posix_ipv4/configure.m4])
m4_include([opal/mca/if/solaris_ipv6/configure.m4])
m4_include([opal/mca/installdirs/config/configure.m4])
m4_include([opal/mca/installdirs/env/configure.m4])
m4_include([opal/mca/memchecker/valgrind/configure.m4])
m4_include([opal/mca/memory/linux/configure.m4])
m4_include([opal/mca/memory/malloc_solaris/configure.m4])
m4_include([opal/mca/memory/patcher/configure.m4])
m4_include([opal/mca/mpool/gpusm/configure.m4])
m4_include([opal/mca/mpool/rgpusm/configure.m4])
m4_include([opal/mca/mpool/udreg/configure.m4])
m4_include([opal/mca/patcher/overwrite/configure.m4])
m4_include([opal/mca/pmix/cray/configure.m4])
m4_include([opal/mca/pmix/external/configure.m4])
m4_include([opal/mca/pmix/pmix112/configure.m4])
m4_include([opal/mca/pmix/s1/configure.m4])
m4_include([opal/mca/pmix/s2/configure.m4])
m4_include([opal/mca/pstat/linux/configure.m4])
m4_include([opal/mca/pstat/test/configure.m4])
m4_include([opal/mca/sec/keystone/configure.m4])
m4_include([opal/mca/sec/munge/configure.m4])
m4_include([opal/mca/shmem/mmap/configure.m4])
m4_include([opal/mca/shmem/posix/configure.m4])
m4_include([opal/mca/shmem/sysv/configure.m4])
m4_include([opal/mca/timer/altix/configure.m4])
m4_include([opal/mca/timer/darwin/configure.m4])
m4_include([opal/mca/timer/linux/configure.m4])
m4_include([opal/mca/timer/solaris/configure.m4])
m4_include([orte/mca/common/alps/configure.m4])
m4_include([orte/mca/ess/alps/configure.m4])
m4_include([orte/mca/ess/lsf/configure.m4])
m4_include([orte/mca/ess/slurm/configure.m4])
m4_include([orte/mca/ess/tm/configure.m4])
m4_include([orte/mca/odls/alps/configure.m4])
m4_include([orte/mca/odls/default/configure.m4])
m4_include([orte/mca/oob/alps/configure.m4])
m4_include([orte/mca/oob/tcp/configure.m4])
m4_include([orte/mca/oob/ud/configure.m4])
m4_include([orte/mca/oob/usock/configure.m4])
m4_include([orte/mca/plm/alps/configure.m4])
m4_include([orte/mca/plm/isolated/configure.m4])
m4_include([orte/mca/plm/lsf/configure.m4])
m4_include([orte/mca/plm/rsh/configure.m4])
m4_include([orte/mca/plm/slurm/configure.m4])
m4_include([orte/mca/plm/tm/configure.m4])
m4_include([orte/mca/ras/alps/configure.m4])
m4_include([orte/mca/ras/gridengine/configure.m4])
m4_include([orte/mca/ras/loadleveler/configure.m4])
m4_include([orte/mca/ras/lsf/configure.m4])
m4_include([orte/mca/ras/slurm/configure.m4])
m4_include([orte/mca/ras/tm/configure.m4])
m4_include([orte/mca/rml/ftrm/configure.m4])
m4_include([orte/mca/rtc/freq/configure.m4])
m4_include([ompi/mca/fbtl/configure.m4])
m4_include([ompi/mca/fcoll/configure.m4])
m4_include([ompi/mca/fs/configure.m4])
m4_include([ompi/mca/io/configure.m4])
m4_include([ompi/mca/mtl/configure.m4])
m4_include([ompi/mca/pml/configure.m4])
m4_include([ompi/mca/rte/configure.m4])
m4_include([ompi/mca/sharedfp/configure.m4])
m4_include([ompi/mca/bml/r2/configure.m4])
m4_include([ompi/mca/coll/cuda/configure.m4])
m4_include([ompi/mca/coll/fca/configure.m4])
m4_include([ompi/mca/coll/hcoll/configure.m4])
m4_include([ompi/mca/coll/portals4/configure.m4])
m4_include([ompi/mca/fbtl/plfs/configure.m4])
m4_include([ompi/mca/fbtl/posix/configure.m4])
m4_include([ompi/mca/fbtl/pvfs2/configure.m4])
m4_include([ompi/mca/fs/lustre/configure.m4])
m4_include([ompi/mca/fs/plfs/configure.m4])
m4_include([ompi/mca/fs/pvfs2/configure.m4])
m4_include([ompi/mca/io/romio314/configure.m4])
m4_include([ompi/mca/mtl/mxm/configure.m4])
m4_include([ompi/mca/mtl/ofi/configure.m4])
m4_include([ompi/mca/mtl/portals4/configure.m4])
m4_include([ompi/mca/mtl/psm/configure.m4])
m4_include([ompi/mca/mtl/psm2/configure.m4])
m4_include([ompi/mca/osc/portals4/configure.m4])
m4_include([ompi/mca/osc/pt2pt/configure.m4])
m4_include([ompi/mca/osc/rdma/configure.m4])
m4_include([ompi/mca/pml/ob1/configure.m4])
m4_include([ompi/mca/pml/ucx/configure.m4])
m4_include([ompi/mca/pml/v/configure.m4])
m4_include([ompi/mca/pml/yalla/configure.m4])
m4_include([ompi/mca/rte/orte/configure.m4])
m4_include([ompi/mca/sharedfp/sm/configure.m4])
m4_include([oshmem/mca/memheap/configure.m4])
m4_include([oshmem/mca/spml/configure.m4])
m4_include([oshmem/mca/atomic/mxm/configure.m4])
m4_include([oshmem/mca/atomic/ucx/configure.m4])
m4_include([oshmem/mca/scoll/fca/configure.m4])
m4_include([oshmem/mca/spml/ikrit/configure.m4])
m4_include([oshmem/mca/spml/ucx/configure.m4])
m4_include([oshmem/mca/sshmem/mmap/configure.m4])
m4_include([oshmem/mca/sshmem/sysv/configure.m4])
m4_include([oshmem/mca/sshmem/verbs/configure.m4])

dnl ---------------------------------------------------------------------------
dnl ---------------------------------------------------------------------------
dnl ---------------------------------------------------------------------------

dnl Open MPI extensions information
dnl ---------------------------------------------------------------------------

dnl List of all MPI extensions
m4_define([ompi_mpiext_list], [affinity, cr, cuda])

dnl List of configure.m4 files to include
m4_include([ompi/mpiext/affinity/configure.m4])
m4_include([ompi/mpiext/cr/configure.m4])
m4_include([ompi/mpiext/cuda/configure.m4])

dnl ---------------------------------------------------------------------------
dnl ---------------------------------------------------------------------------
dnl ---------------------------------------------------------------------------

dnl Open MPI contrib information
dnl ---------------------------------------------------------------------------

dnl List of all MPI contribs
m4_define([ompi_mpicontrib_list], [libompitrace])

dnl List of configure.m4 files to include
m4_include([ompi/contrib/libompitrace/configure.m4])
