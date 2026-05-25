//______________________________________________________________________
//______________________________________________________________________
// syscall-test-common/syscall-types.h       
#ifndef SYSCALL_TYPES_H
#define SYSCALL_TYPES_H
//______________________________________________________________________
// Enumeration for syscall numbers
//______________________________________________________________________
enum SYSCALL_NUMS
{ THE_SYSCALL_NUM
, SYSCALL_COUNT
};

enum SYSCALL_GROUPS
{ GROUP0
, GROUP_COUNT
};

//______________________________________________________________________
// Types used in syscall
//______________________________________________________________________
typedef struct{ double in_dbl_var;
  char   in_chr_var;
} SYSCALL_IN_DATA_TYPE;

typedef struct
{ double out_dbl_var;
  char   out_chr_var;
} SYSCALL_OUT_DATA_TYPE;


#endif


