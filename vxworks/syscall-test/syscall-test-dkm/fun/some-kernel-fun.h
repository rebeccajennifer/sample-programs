//______________________________________________________________________
//______________________________________________________________________
#ifndef SOME_KERNEL_FUN
#define SOME_KERNEL_FUN

#include "syscall-types.h"

// Called from syscall handler
void handler_callee
( SYSCALL_IN_DATA_TYPE*  in_data
, SYSCALL_OUT_DATA_TYPE* out_data
);

#endif

