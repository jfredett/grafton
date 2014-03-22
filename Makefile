CC=clang
CFLAGS=

SRCDIR=src
OBJDIR=obj
TESTDIR=test
BINDIR=bin


.DEFAULT_GOAL:=all

-include build/common.make
-include build/grafton.make

all: bin/grafton
