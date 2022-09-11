// Hedin A. García Hernández
// INEL4206-030
// Print messages with different delays and make use of FreeRTOS tasks

#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"

struct task_parameter{
  unsigned int task_ID_number;
  unsigned int task_delay;
  char task_message [50];
};

void task_print_message(void* param){
  unsigned int taskNumber = ((task_parameter *) param) -> task_ID_number;
  unsigned int delayOfmessage = ((task_parameter *) param) -> task_delay;
  char message [50];
  strcpy(message, ((task_parameter *) param) -> task_message);
  while(1){
    printf("This message is coming from task #%i : %s.\n", taskNumber, message);
    vTaskDelay(((int )delayOfmessage)/portTICK_PERIOD_MS);
  }
}
extern "C" void app_main(){
  //Task #1 with its delay.
  task_parameter param1 = {1,4000, "Good morning"};
  xTaskCreate(&task_print_message, "Task 1", 2048, &param1, 5, NULL);

  //Task #2 with its delay.
  task_parameter param2 = {2,7000 , "Good afternoon"};
  xTaskCreate(&task_print_message, "Task 2", 2048, &param2, 5, NULL);

  //Task #3 with its delay.
  task_parameter param3 = {3,19000, "Good night"};
  xTaskCreate(&task_print_message, "Task 3", 2048, &param3, 5, NULL);
}
