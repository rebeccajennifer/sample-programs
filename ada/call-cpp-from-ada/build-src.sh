#_______________________________________________________________________
# Used to build a minimal Ada program that calls C++ functions.
#_______________________________________________________________________

# Compile C code
g++ -c cpp_fun.cpp

# Link .o produced by cpp to ada
gnatmake -o a.out ada_main.adb -largs cpp_fun.o -lstdc++

