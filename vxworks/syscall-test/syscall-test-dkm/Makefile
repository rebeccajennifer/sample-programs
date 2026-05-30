FUN		= ./fun
SYSCALLS= ./syscalls
COMMON	= ../syscall-test-common

all: syscall-test-dkm.out

some-kernel-fun.o: $(FUN)/some-kernel-fun.cpp $(FUN)/some-kernel-fun.h
	wr-cc -dkm -c $(FUN)/some-kernel-fun.cpp -I$(FUN) -I$(COMMON)

syscall-kernel.o: $(SYSCALLS)/syscall-kernel.cpp $(SYSCALLS)/syscall-kernel.h
	wr-cc -dkm \
	-I$(FUN) -I$(COMMON) -c $(SYSCALLS)/syscall-kernel.cpp

dkm.o: dkm.cpp
	wr-cc -dkm -I$(SYSCALLS) -I$(COMMON) -c dkm.cpp

syscall-test-dkm.out: some-kernel-fun.o syscall-kernel.o dkm.o
	wr-cc -dkm 				\
	some-kernel-fun.o		\
	syscall-kernel.o		\
	dkm.o					\
	-o syscall-test-dkm.out

clean:
	rm -f *.o *.out

