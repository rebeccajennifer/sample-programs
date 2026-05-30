#! /usr/bin/bash
#_______________________________________________________________________
# Script to build RTP
#_______________________________________________________________________

export ALG='./algs'
export SYSCALLS='./syscalls'
export COMMON='../syscall-test-common'


# Clean directory
rm -f *.o
rm -f *.vxe

# Build object files
wr-cc -rtp -c              \
$SYSCALLS/syscall-user.cpp \
-I$ALG                     \
-I$COMMON                  \
-o syscall-user.o

wr-cc -rtp -c              \
$ALG/some-alg.cpp          \
syscall-user.o             \
-I$ALG                     \
-I$COMMON                  \
-o some-alg.o


# Build executable
wr-cc -rtp                 \
rtp.cpp                    \
some-alg.o                 \
syscall-user.o             \
-static                    \
-I$ALG                     \
-I$COMMON                  \
-o syscall-test-rtp.vxe

