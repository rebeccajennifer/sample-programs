//______________________________________________________________________
// DESCRIPTION
// Simple example used to test clang-format.
//______________________________________________________________________

#include "clang-format-example.hpp"
#include <stdio.h>

int main()
{
  SomeClass flux = SomeClass(42);

  printf("\n\nSomeClass int_var_: %d\n\n", flux.get_int_var());
}
