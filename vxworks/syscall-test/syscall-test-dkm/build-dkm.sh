#! /usr/bin/bash
#_______________________________________________________________________
# Script to build RTP
#_______________________________________________________________________

export FUN='./fun'
export SYSCALLS='./syscalls'
export COMMON='../syscall-test-common'

rm -f *.o
rm -f *.out

wr-cc -dkm -c                 \
$FUN/some-kernel-fun.cpp      \
-I$FUN                        \
-I$COMMON                     \
-o some-kernel-fun.o

wr-cc -dkm -c                 \
$SYSCALLS/syscall-kernel.cpp  \
-I$FUN                        \
-I$COMMON                     \
-o syscall-kernel.o

wr-cc -dkm -c                 \
dkm.cpp                       \
-I$SYSCALLS                   \
-I$COMMON                     \
-o dkm.o

wr-cc -dkm                    \
some-kernel-fun.o             \
syscall-kernel.o              \
dkm.o                         \
-o syscall-test-dkm.out

