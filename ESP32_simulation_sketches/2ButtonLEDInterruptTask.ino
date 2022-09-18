//Implement AND operation for the buttons to determine when to turn the LED on
#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "driver/gpio.h"

#define redButtonPin GPIO_NUM_4
#define blueButtonPin GPIO_NUM_14
#define ledPin GPIO_NUM_27
#define ON 1
#define OFF 0

bool redButtonState = LOW;
bool blueButtonState = LOW;

long lastDebounceTime = 0;
long debounceDelay = 10; 

//When the red button is pressed.
static void redButton_isr_handler(void* param){
  redButtonState = !redButtonState;
}

void initRedButton(){
  gpio_reset_pin(redButtonPin);
  gpio_set_direction(redButtonPin, GPIO_MODE_INPUT);
  gpio_set_pull_mode(redButtonPin, GPIO_PULLUP_ONLY);
  gpio_set_intr_type(redButtonPin, GPIO_INTR_NEGEDGE);
  gpio_isr_handler_add(redButtonPin, redButton_isr_handler, NULL);

}

//When the blue button is pressed.
static void blueButton_isr_handler(void* param){
  blueButtonState = !blueButtonState;
}

void initBlueButton(){
  gpio_reset_pin(blueButtonPin);
  gpio_set_direction(blueButtonPin, GPIO_MODE_INPUT);
  gpio_set_pull_mode(blueButtonPin, GPIO_PULLUP_ONLY);
  gpio_set_intr_type(blueButtonPin, GPIO_INTR_NEGEDGE);
  gpio_isr_handler_add(blueButtonPin, blueButton_isr_handler, NULL);

}

void initLED(){
  gpio_reset_pin(ledPin);
  gpio_set_direction(ledPin, GPIO_MODE_OUTPUT);
  gpio_set_level(ledPin, OFF);
}

void task_lightUpLED(void *param){
  while(1){
    if(millis() - lastDebounceTime > debounceDelay){
      if(redButtonState){
        printf("Red button state is high.\n");
        if(blueButtonState){
          printf("Both buttons were pressed.\n");
          gpio_set_level(ledPin, ON);
          lastDebounceTime = millis();
        }
      }
      if(blueButtonState){
        printf("Blue button state is high.\n");
        if(redButtonState){
          printf("Both buttons were pressed.\n");
          gpio_set_level(ledPin, ON);
          lastDebounceTime = millis();
        }
      }
      if(redButtonState == LOW){
        printf("Red button state is low.\n");
        gpio_set_level(ledPin, OFF);
        lastDebounceTime = millis();
      }
      if(blueButtonState == LOW){
        printf("Blue button state is low.\n");
        gpio_set_level(ledPin, OFF);
        lastDebounceTime = millis();
      }
      vTaskDelay(1000/portTICK_PERIOD_MS);
    }
  }
}
void setup(){
  gpio_install_isr_service(0);
  initRedButton();
  initBlueButton();
  initLED();
  xTaskCreate(&task_lightUpLED, "Light up LED", 2048, NULL, 5, NULL);
}
void loop(){}
