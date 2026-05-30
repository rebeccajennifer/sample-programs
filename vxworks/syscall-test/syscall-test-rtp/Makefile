ALG     = ./algs
SYSCALLS= ./syscalls
COMMON  = ../syscall-test-common

all: syscall-test-rtp.vxe

syscall-user.o: $(SYSCALLS)/syscall-user.cpp $(SYSCALLS)/syscall-user.h
	wr-cc -rtp -c					\
	$(SYSCALLS)/syscall-user.cpp 	\
	-I$(ALG)						\
	-I$(COMMON)

some-alg.o: $(ALG)/some-alg.cpp $(ALG)/some-alg.h
	wr-cc -rtp -c		\
	$(ALG)/some-alg.cpp	\
	-I$(ALG)			\
	-I$(COMMON)

rtp.o: rtp.cpp
	wr-cc -rtp -c		\
	rtp.cpp				\
	-I$(ALG)			\
	-I$(COMMON)

syscall-test-rtp.vxe: some-alg.o syscall-user.o rtp.o
	wr-cc -rtp			\
	-static				\
	syscall-user.o		\
	some-alg.o			\
	rtp.o				\
	-o syscall-test-rtp.vxe
    
clean:
	rm -f *.o *.out

