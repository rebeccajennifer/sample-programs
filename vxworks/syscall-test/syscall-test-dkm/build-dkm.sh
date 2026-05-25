#! /usr/bin/bash
#_______________________________________________________________________
# Script to build RTP
#_______________________________________________________________________

export FUN='./fun'
export SYSCALLS='./syscalls'
export COMMON='../syscall-test-common'

wr-cc -c $FUN/some-kernel-fun.cpp \
-I$FUN                            \
-I$COMMON                         \
-o some-kernel-fun.o

wr-cc -dkm -c $SYSCALLS/syscall-kernel.cpp \
-I$FUN                                \
-I$COMMON                             \
-o syscall-kernel.o

wr-cc                     \
-dkm  dkm.c               \
syscall-kernel.o          \
-I$SYSCALLS               \
-I$COMMON                 \
-o syscall-test-dkm.out

