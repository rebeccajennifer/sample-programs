//______________________________________________________________________
//______________________________________________________________________

#include <ioLib.h>
#include <rtpLib.h>
#include <stdio.h>
#include <syslog.h>

#include "vxWorks.h"

#include "syscall-kernel.h"


//______________________________________________________________________
void start(void)
{

  // Update this path to the correct path to the built vxe
  const char *rtp_path =
    "/host.dcsg472"
    "/home/z1165736/git/gensoft-examples"
    "/proj/apps/vxsim-rtp-examples/syscall-example/syscall-test-rtp"
    "/vsb-vxsim-22_09_SIMLINUXllvm_LP64_ld"
    "/syscall-test-rtp/Debug/syscall-test-rtp.vxe";

  register_syscall_group();

  int rtp_id;

  rtp_id = rtpSpawn
  ( rtp_path
  , 0
  , 0
  , 1
  , 100
  , 0
  , 0
  );

  if (rtp_id == ERROR)
    syslog
    ( LOG_USER
    , "\n Unable to launch RTP :("
      "\n Error: %d"
      "\n"
    , errnoGet()
    );

  else
    syslog
    ( LOG_USER
    , "\n RTP launched! :D"
      "\n"
    );
}

