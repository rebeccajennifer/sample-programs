#! /usr/bin/bash
#_______________________________________________________________________
# Script to build RTP
#_______________________________________________________________________

export ALG='./algs'
export SYSCALLS='./syscalls'
export COMMON='../syscall-test-common'

wr-cc -c $ALG/some-alg.cpp  \
-I$ALG                      \
-I$COMMON                   \
-o some-alg.o

wr-cc -c $SYSCALLS/syscall-user.cpp \
-I$ALG                      \
-I$COMMON                   \
-o syscall-user.o

wr-cc                     \
-rtp  rtp.c               \
some-alg.o                \
syscall-user.o            \
-static                   \
-I$ALG                    \
-I$COMMON                 \
-o syscall-test-rtp.vxe

