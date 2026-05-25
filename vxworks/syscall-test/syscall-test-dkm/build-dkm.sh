#! /usr/bin/bash
#_______________________________________________________________________
# Script to build RTP
#_______________________________________________________________________

export FUN='./fun'
export SYSCALLS='./syscalls'
export COMMON='../syscall-test-common'


KRNL=$WIND_HOME/vxsdk/sysroot/krnl/h/public
#
#wr-cc -c $SYSCALLS/syscall-kernel.cpp -I$FUN -I$COMMON -v

wr-cc -c $FUN/some-kernel-fun.cpp \
-I$FUN                            \
-I$COMMON                         \
-o some-kernel-fun.o

wr-cc -dkm -c $SYSCALLS/syscall-kernel.cpp \
-I$FUN                                \
-I$COMMON                             \
-o syscall-kernel.o

#wr-cc                     \
#-rtp  rtp.c               \
#some-alg.o                \
#syscall-user.o            \
#-static                   \
#-I$ALG                    \
#-I$COMMON                 \
#-o syscall-test-dkm.out

