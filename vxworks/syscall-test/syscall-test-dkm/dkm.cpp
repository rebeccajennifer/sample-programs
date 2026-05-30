//______________________________________________________________________
//______________________________________________________________________

#include <ioLib.h>
#include <rtpLib.h>
#include <syslog.h>
#include <errnoLib.h>

#include <stdio.h>


#include "vxWorks.h"

#include "syscall-kernel.h"


//______________________________________________________________________
void start(void)
{

   char cwd[1024];
   ioDefPathGet(cwd);
   printf("\ncwd: %s\n", cwd);

  // Update this path to the correct path to the built vxe
  const char *rtp_path =
    "/host.host"
    "/git/sample-programs/vxworks/syscall-test"
    "/syscall-test-rtp/syscall-test-rtp.vxe";

  register_syscall_group();

  RTP_ID rtp_id;

  rtp_id = rtpSpawn
  ( rtp_path
  , 0
  , 0
  , 1
  , 100
  , 0
  , 0
  );

  if (rtp_id == RTP_ID_ERROR)
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

