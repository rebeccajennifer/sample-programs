#include <stdio.h>
#include <syslog.h>

#include "some-kernel-fun.h"

//______________________________________________________________________
// Function called by the syscall handler
//______________________________________________________________________
void handler_callee
( SYSCALL_IN_DATA_TYPE*  in_data
, SYSCALL_OUT_DATA_TYPE* out_data
)
{
  out_data->out_dbl_var = in_data->in_dbl_var * 2;
  out_data->out_chr_var = in_data->in_chr_var * 2;

  syslog
  ( LOG_USER
  , "\n================================================"
    "\n DKM: handler_callee"
    "\n"
    "\n After operation"
    "\n================================================"
    "\n out_data->out_dbl_var: %lf"
    "\n out_data->out_chr_var: 0x%02x"
    "\n================================================"
    "\n"
  , out_data->out_chr_var
  , out_data->out_dbl_var
  );

}


