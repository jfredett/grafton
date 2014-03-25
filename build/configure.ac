AC_INIT([grafton], [0.0.1],
        [jfredett@gmail.com],
        [grafton],
        [http://github.com/jfredett/grafton])

AC_PREREQ([2.68])

AC_PROG_CC([clang gcc])

AC_INCLUDES_DEFAULT

AC_CHECK_HEADERS([zeromq.h])
AC_CHECK_HEADERS([czmq.h])
AC_CHECK_HEADERS([yajl.h])
AC_CHECK_HEADERS([check.h])

AC_CONFIG_HEADERS([src/config.h])
AC_CONFIG_FILES([Makefile])

AC_OUTPUT
