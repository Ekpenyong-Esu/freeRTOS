/*
 * STM32_Disc1_Gpio.h
 *
 *  Created on: Jan 21, 2023
 *      Author: mahon
 */

#ifndef INC_STM32_DISC1_GPIO_H_
#define INC_STM32_DISC1_GPIO_H_

#include <stdint.h>


//Create a typedef defining a simple function pointer
//to be used for LED's
typedef void (*GPIOFunc)(void);  // This function pointer will point to Led ON and OFF funtions



//this struct holds function pointers to turn each LED
//on and off
typedef struct
{
	const GPIOFunc On;
	const GPIOFunc Off;
}LED;


// Creating an Object from the LED struct.
extern LED BlueLed;
extern LED GreenLed;
extern LED RedLed;


uint8_t ReadPushButton( void );

#endif /* INC_STM32_DISC1_GPIO_H_ */
