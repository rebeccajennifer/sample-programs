//______________________________________________________________________
//______________________________________________________________________

#include <syslog.h>
#include "syscall-kernel.h"
#include "syscall-types.h"
#include "some-kernel-fun.h"


//______________________________________________________________________
// From API reference
//______________________________________________________________________
// SYSCALL_DESC_ENTRY
//     (
//     syscallRoutine,   /* function pointer to system call handler */
//     syscallName,      /* system call name */
//     numArgs           /* number of arguments to syscallRoutine */
//     )
//______________________________________________________________________
static SYSCALL_RTN_TBL_ENTRY syscall_table[SYSCALL_COUNT] =
{ SYSCALL_DESC_ENTRY(the_syscall_handler, (char*)"the_syscall", 2)
};


//______________________________________________________________________
STATUS register_syscall_group()
{
  if (
    syscallGroupRegister
    ( GROUP0
    , (char*)"syscall_group_0"
    , SYSCALL_COUNT
    , syscall_table
    , true
    ) == ERROR
  )
  {
    syslog(LOG_USER, "\n ERROR registering syscall group.\n");
    return ERROR;
  }
  else
  {
    syslog(LOG_USER, "\n SUCCESS! Syscall group registered.\n");
    return ERROR;
  }
}


//______________________________________________________________________
STATUS the_syscall_handler(syscall_args* args)
{
  syslog
  ( LOG_USER
  , "\n------------------------------------------------"
    "\n DKM: the_syscall_handler"
    "\n"
    "\n Before handler callee"
    "\n------------------------------------------------"
    "\n in_data->in_dbl_var: %lf"
    "\n in_data->in_chr_var: 0x%02x"
    "\n------------------------------------------------"
    "\n"
  , args->in_data->in_chr_var
  , args->in_data->in_dbl_var
  );

  handler_callee(args->in_data, args->out_data);

  syslog
  ( LOG_USER
  , "\n------------------------------------------------"
    "\n DKM: the_syscall_handler"
    "\n"
    "\n After handler callee"
    "\n------------------------------------------------"
    "\n out_data->out_dbl_var: %lf"
    "\n out_data->out_chr_var: 0x%02x"
    "\n------------------------------------------------"
    "\n"
  , args->out_data->out_chr_var
  , args->out_data->out_dbl_var
  );

  return OK;
}


//______________________________________________________________________
// From API reference
//______________________________________________________________________
// STATUS syscallGroupRegister
//     (
//     int                     groupNum,      /* group number */
//     char *                  groupName,     /* group name   */
//     int                     numRoutines,   /* number of system call routines */
//     SYSCALL_RTN_TBL_ENTRY * pRoutineTbl,   /* system call routine table address */
//     BOOL                    force          /* forcibly overwrite an existing */
//                                            /* entry helps when debugging */
//     )
//______________________________________________________________________
STATUS register_rtp_syscalls()
{
  if
  ( syscallGroupRegister
    ( GROUP0
    , (char*)"group_0_name"
    , SYSCALL_COUNT
    , syscall_table
    , TRUE
    ) == ERROR
  )
  {
    syslog(LOG_USER, "\nError registering RTP syscalls\n");
    return ERROR;
  }

  else
    return OK;
}

