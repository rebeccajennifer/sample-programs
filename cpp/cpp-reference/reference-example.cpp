//______________________________________________________________________
// Sample program to demonstrate pointers and references.
//______________________________________________________________________

#include <stdio.h>


struct foo
{
  int a = 9;
};


int main()
{
  foo  a_foo;
  foo* bar    = &a_foo;

  foo & bunny = *bar;
  bunny.a     = 88;

  printf("\n");
  printf("bar->a  : %d\n" , bar->a);
  printf("bunny.a : %d\n" , bunny.a);
  printf("\n");

  return 0;
}
