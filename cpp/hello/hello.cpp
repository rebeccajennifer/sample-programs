//______________________________________________________________________
// DESCRIPTION
// Simple program that prints a message and an input argument, that is
// expected to be an integer.
//______________________________________________________________________
#include <cstdio>
#include <cstdlib>

int main(int argc, char* argv[])
{
  int i = -1;

  // Convert input C-style string (e.g. char*) to integer
  if (argc > 1)
  {
    i = std::atoi(argv[1]);
  }

  printf(
    "\n\nHello there :)"
    "\n\nInput argument: %d"
    "\n\n"
    , i
  );

  return 0;
}
