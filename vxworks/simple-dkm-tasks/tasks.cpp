/* includes */

#include "vxWorks.h"
#include <stdio.h>
#include <taskLib.h>
#include <semLib.h>

SEM_ID task_sem;

void task0Fun()
{
  printf("\ntask0Fun");
  printf("\nTask0 ID: %ld", (long int)taskIdSelf());
  printf("\n");

  while(1)
  {
    // Wait for semaphore
    semTake(task_sem, WAIT_FOREVER);

    printf("\n");
    printf("\n________________");
    printf("\nTask0 ID: %ld", (long int)taskIdSelf());
    printf("\n");

    for (int i = 0; i < 4; i++)
    {
      printf("\nTask0 print %d", i);
    }

    taskDelay(50);
    semGive(task_sem);
  }
}

void task1Fun()
{
  printf("\ntask1Fun");
  printf("\nTask1 ID: %ld", (long int)taskIdSelf());
  printf("\n");

  while(1)
  {
    // Wait for semaphore
    semTake(task_sem, WAIT_FOREVER);

    printf("\n");
    printf("\n================");
    printf("\nTask1 ID: %ld", (long int)taskIdSelf());
    printf("\n");

    for (int i = 0; i < 4; i++)
    {
      printf("\nTask1 print %d", i);
    }

    taskDelay(50);
    semGive(task_sem);
  }
}

void task2Fun()
{
  printf("\ntask2Fun");
  printf("\nTask2 ID: %ld", (long int)taskIdSelf());
  printf("\n");

  while(1)
  {
    // Wait for semaphore
    semTake(task_sem, WAIT_FOREVER);

    printf("\n");
    printf("\n################");
    printf("\nTask2 ID: %ld", (long int)taskIdSelf());
    printf("\n");

    for (int i = 0; i < 4; i++)
    {
      printf("\nTask2 print %d", i);
    }

    taskDelay(50);
    semGive(task_sem);
  }
}


void start(void) {
  printf("\n___________________________________________");
  printf("\nSTART!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
  printf("\n___________________________________________");

  // Start semaphore as full, so it can be taken
  //task_sem = semBCreate(SEM_Q_PRIORITY, SEM_FULL);
  task_sem = semBCreate(SEM_Q_FIFO, SEM_FULL);

  TASK_ID task0_id = taskCreate((char*)"Task0Name"
    , 0                                           // priority
    , 0                                           // task option
    , 512                                         // size (bytes) of stack needed
    , (FUNCPTR)task0Fun                           // entry point of new task
    , 0,0,0,0,0,0,0,0,0,0);                       // arguments to tasks - type Vx_usr_arg_t arg1


  TASK_ID task1_id = taskCreate((char*)"Task1Name"
    , 1
    , 0
    , 512
    , (FUNCPTR)task1Fun
    , 0,0,0,0,0,0,0,0,0,0);


  TASK_ID task2_id = taskCreate((char*)"Task2Name"
    , 2
    , 0
    , 512
    , (FUNCPTR)task2Fun
    , 0,0,0,0,0,0,0,0,0,0);

  printf("\nTask 0 ID: %ld", (long int)task0_id);
  printf("\nTask 1 ID: %ld", (long int)task1_id);
  printf("\nTask 2 ID: %ld", (long int)task2_id);
  printf("\n");

  taskActivate(task0_id);
  taskActivate(task1_id);
  taskActivate(task2_id);
}
