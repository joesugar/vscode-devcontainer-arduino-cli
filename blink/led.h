#ifndef LED_H_
#define LED_H_

#include <Arduino.h>

#define LED_PIN 25

class LED
{
    public:
        LED();

        void turnOn(void);
        void turnOff(void);
};

#endif
