//______________________________________________________________________
//______________________________________________________________________

#include <vxWorks.h>
#include <syscall.h>
#include <syslog.h>

#include "syscall-types.h"
#include "syscall-user.h"


//______________________________________________________________________
void the_syscall
( SYSCALL_IN_DATA_TYPE*  in_data
, SYSCALL_OUT_DATA_TYPE* out_data
)
{
  syslog
  ( LOG_USER
  , "\n________________________________________________"
    "\n RTP: the_syscall"
    "\n"
    "\n Before the syscall"
    "\n________________________________________________"
    "\n in_data->in_chr_var: 0x%02x"
    "\n in_data->in_dbl_var: %lf"
    "\n________________________________________________"
    "\n"
  , in_data->in_chr_var
  , in_data->in_dbl_var
  );

  STATUS ret_val;

  ret_val = syscall
    ( (_Vx_usr_arg_t) in_data
    , (_Vx_usr_arg_t) out_data
    , 0, 0, 0, 0, 0, 0
    , SYSCALL_NUMBER(GROUP0, THE_SYSCALL_NUM)
    );

  syslog
  ( LOG_USER
  , "\n________________________________________________"
    "\n RTP: the_syscall"
    "\n"
    "\n After the syscall"
    "\n________________________________________________"
    "\n out_data->out_chr_var: 0x%02x"
    "\n out_data->out_dbl_var: %lf"
    "\n________________________________________________"
    "\n"
  , out_data->out_chr_var
  , out_data->out_dbl_var
  );
}

