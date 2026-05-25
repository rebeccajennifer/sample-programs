//______________________________________________________________________
// cpp_main.cpp
//______________________________________________________________________
// This is a minimal C++ program that calls an Ada function.
//______________________________________________________________________
//
// Build steps:
//
// gnatmake -c pkg_test
// g++      -c cpp_main.cpp
// gnatbind -n pkg_test
// gnatlink pkg_test -o out.exe --LINK=g++ -lstdc++ cpp_main.o
//______________________________________________________________________

#include <stdio.h>

//______________________________________________________________________
extern "C"
{
  void cpp_import_ada_print_arg(int int_arg);

  // Required to link Ada
  void adainit();
  void adafinal();
}

//______________________________________________________________________
int main (void)
{
  // Required for Ada link
  adainit();

  int arg = 42;
  printf("\n Calling Ada...\n\n");

  cpp_import_ada_print_arg(arg);

  // Required for Ada link
  adafinal();

  return 0;
}

