
#include "led.h"

LED::LED()
{
    pinMode(LED_PIN, OUTPUT);
}

void LED::turnOn()
{
    digitalWrite(LED_PIN, HIGH);
}

void LED::turnOff()
{
    digitalWrite(LED_PIN,LOW);
}
