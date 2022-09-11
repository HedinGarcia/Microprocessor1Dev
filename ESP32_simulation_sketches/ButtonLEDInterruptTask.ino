// Hedin A. García Hernández
// INEL4206-030
// Use an interrupt to light up LED with a button and print messages in a separate task.

#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "driver/gpio.h"

#define button_pin GPIO_NUM_4
#define led_pin GPIO_NUM_27
#define ON HIGH
#define OFF LOW

bool button_pressed = false;

void task_PrintMessage(void* param){
  while(1){
    printf("Message being printed by a task.\n");
    vTaskDelay(2000/portTICK_PERIOD_MS);
  }
}

// Interrrupt to change value of pushbutton when pressed
static void button_isr_handler(void* args){
  button_pressed = true;
}

void init_button(){
  gpio_install_isr_service(0);
  gpio_reset_pin(button_pin);
  gpio_set_direction(button_pin, GPIO_MODE_INPUT);
  gpio_pullup_en(button_pin);
  gpio_set_intr_type(button_pin, GPIO_INTR_NEGEDGE);
  gpio_isr_handler_add(button_pin, button_isr_handler, NULL);
}

void init_led(){
  gpio_reset_pin(led_pin);
  gpio_set_direction(led_pin, GPIO_MODE_OUTPUT);
}

void task_button(void* param){
  int led_state = OFF;
  while(1){
    if(button_pressed == true){
      printf("Button was pressed.\n");
      button_pressed = false;
      led_state = !led_state;
      gpio_set_level(led_pin,led_state);
    }
    vTaskDelay(1000/portTICK_PERIOD_MS);
  }
}

extern "C" void app_main(){
  init_button();
  init_led();
  xTaskCreate(&task_PrintMessage, "Task for printing messages", 2048, NULL, 5, NULL);
  xTaskCreate(&task_button, "Task for button", 2048, NULL, 5, NULL);

}
