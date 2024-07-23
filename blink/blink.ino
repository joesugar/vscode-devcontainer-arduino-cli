#include "led.h"

LED led;

void setup() 
{
    
}

void loop() 
{
    led.turnOn();
    delay(500);                    
    led.turnOff();
    delay(500);
}
