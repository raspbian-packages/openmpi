# -*- shell-script -*-
#
# Copyright (c) 2009      Cisco Systems, Inc. All rights reserved.
# $COPYRIGHT$
# 
# Additional copyrights may follow
# 
# $HEADER$
#

# MCA_sysinfo_darwin_CONFIG([action-if-found], [action-if-not-found])
# -----------------------------------------------------------
AC_DEFUN([MCA_sysinfo_darwin_CONFIG],[
    OMPI_VAR_SCOPE_PUSH([sysinfo_darwin_happy])
    # check to see if we have <mach/clock.h>
    # as this is a Darwin-specific thing
    AC_CHECK_HEADER([mach/clock.h], [sysinfo_darwin_happy=yes], [sysinfo_darwin_happy=no])

    AS_IF([test "$sysinfo_darwin_happy" = "yes"], [$1], [$2])
    OMPI_VAR_SCOPE_POP
])dnl

