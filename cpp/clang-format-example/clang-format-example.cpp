//______________________________________________________________________
// DESCRIPTION
// Simple example used to test clang-format.
//______________________________________________________________________

#include "clang-format-example.hpp"

#include "a-some-include.h"

#include <stdio.h>

#define FOO        123
#define FLUX_BUNNY 456

#ifdef FOO
#  include <vector>
#  define RABBIT
#endif

SomeClass::SomeClass()
  : int_var_(42)
  , dbl_var_(3.14)
  , long_int_(0xaaaaaaaabbbbbbbb)
  , short_var_(0xFF)
  , bool_var_(true)
{
}

struct SomeStruct
{
  int a_     : 3;
  int b_cde_ : 28;
};

struct AnotherStruct
{
  int a_;
  int b_cde_;

  unsigned long int* fg_;
  bool               hij_;
  short*             klm_;
};

//________________________________________________________________________
void fun(int* foo, double bar, unsigned long int trevor,
  unsigned long long int duke)
{

  int   a = 8;
  short b = 0xFF;
  printf("fun"); // Test comment
  return;        // Test comment
}

//______________________________________________________________________
int main()
{
  SomeClass flux = SomeClass(42);

  if (true)
  {
    printf("\n\nSomeClass int_var_: %d\n\n", flux.get_int_var());
  }
}
