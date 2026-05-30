//______________________________________________________________________
//______________________________________________________________________

#ifndef SYSCALL_USER_H
#define SYSCALL_USER_H

#include "syscall-types.h"


void the_syscall
( SYSCALL_IN_DATA_TYPE*  in_data
, SYSCALL_OUT_DATA_TYPE* out_data
);

#endif

