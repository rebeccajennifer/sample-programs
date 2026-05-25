//______________________________________________________________________
//______________________________________________________________________

#include <syslog.h>
#include "some-alg.h"



int main (int argc, char * argv[])
{
  syslog
  ( LOG_USER
  , "\n________________________________________________"
    "\n Starting RTP for System Call Example"
    "\n________________________________________________"
    "\n"
  );

  the_function_that_calls();

  return 0;
}

