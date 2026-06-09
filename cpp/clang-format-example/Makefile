#_______________________________________________________________________
# DESCRIPTION
# Makefile for simple example used to test clang-format.
#_______________________________________________________________________

all: clang-format-example.out

clang-format-example.o: clang-format-example.cpp clang-format-example.hpp
	g++ -c clang-format-example.cpp -I.

clang-format-example.out: clang-format-example.o
	g++ clang-format-example.o -o a.out

clean:
	rm -f *.o *.out