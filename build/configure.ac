AC_INIT([grafton], [0.0.1],
        [jfredett@gmail.com],
        [grafton],
        [http://github.com/jfredett/grafton])

AC_PREREQ([2.68])

AC_PROG_CC([clang gcc])

AC_INCLUDES_DEFAULT

AC_CHECK_HEADERS([zmq.h])
AC_CHECK_HEADERS([czmq.h])
AC_CHECK_HEADERS([check.h])
AC_CHECK_HEADERS([uuid/uuid.h])
# yajl doesn't have a yajl.h >.<
AC_CHECK_HEADERS([yajl/yajl_parse.h])

AC_CONFIG_HEADERS([src/config.h])
AC_CONFIG_FILES([Makefile])

# Set up cflags

CFLAGS=
CFLAGS+="-fPIC"
AC_ARG_ENABLE([debug],
              AC_HELP_STRING([--enable-debug],[enable debug symbols]),
              CFLAGS+=" -g")
AC_ARG_ENABLE([warnings],
              AC_HELP_STRING([--enable-warnings],[enable warnings-as-errors]),
              CFLAGS+=" -Wall -Werror")
AC_ARG_ENABLE([optimize],
              AC_HELP_STRING([--enable-optimize],[turn on the optimizations]),
              CFLAGS+=" -O2")

AC_OUTPUT
