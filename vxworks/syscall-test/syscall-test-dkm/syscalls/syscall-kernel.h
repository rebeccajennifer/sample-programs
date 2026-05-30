//______________________________________________________________________
//______________________________________________________________________

#ifndef SYSCALL_KERNEL_H
#define SYSCALL_KERNEL_H

#include <syscallLib.h>
#include "syscall-types.h"

typedef struct
{ SYSCALL_IN_DATA_TYPE*  in_data;
  SYSCALL_OUT_DATA_TYPE* out_data;
} syscall_args;

//______________________________________________________________________
#ifdef __cplusplus
extern "C"
{
#endif

STATUS register_syscall_group();

#ifdef __cplusplus
}
#endif
//______________________________________________________________________

STATUS the_syscall_handler(syscall_args* args);

#endif

