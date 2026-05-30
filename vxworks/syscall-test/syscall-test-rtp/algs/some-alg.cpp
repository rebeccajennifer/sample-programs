//______________________________________________________________________
//______________________________________________________________________

#include <syslog.h>
#include "some-alg.h"

//______________________________________________________________________
// Forward declaration of the syscall
//______________________________________________________________________
void the_syscall
( SYSCALL_IN_DATA_TYPE* in_data
, SYSCALL_OUT_DATA_TYPE* out_data
);


//______________________________________________________________________
void the_function_that_calls()
{
  SYSCALL_IN_DATA_TYPE  in_data;
  SYSCALL_OUT_DATA_TYPE out_data;

  in_data.in_dbl_var = 1.5;
  in_data.in_chr_var = 0x08;

  syslog
  ( LOG_USER
  , "\n================================================"
    "\n RTP: the_function_that_calls"
    "\n"
    "\n Before the_syscall"
    "\n================================================"
    "\n in_data.in_chr_var: 0x%02x"
    "\n in_data.in_dbl_var: %lf"
    "\n================================================"
    "\n"
  , in_data.in_chr_var
  , in_data.in_dbl_var
  );

  the_syscall(&in_data, &out_data);

  syslog
  ( LOG_USER
  , "\n================================================"
    "\n RTP: the_function_that_calls"
    "\n"
    "\n After the_syscall"
    "\n================================================"
    "\n out_data.out_chr_var: 0x%02x"
    "\n out_data.out_dbl_var: %lf"
    "\n================================================"
    "\n"
  , out_data.out_chr_var
  , out_data.out_dbl_var
  );

  return;
}

