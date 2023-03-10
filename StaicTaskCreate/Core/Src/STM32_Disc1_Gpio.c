/*
 * STM32_Disc1_Gpio.c
 *
 *  Created on: Jan 21, 2023
 *      Author: mahon
 */

#include "STM32_Disc1_Gpio.h"
#include "main.h"



void GreenOn ( void ) {HAL_GPIO_WritePin(GPIOG, GPIO_PIN_13, GPIO_PIN_SET);}
void GreenOff ( void ) {HAL_GPIO_WritePin(GPIOG, GPIO_PIN_13, GPIO_PIN_RESET);}
LED GreenLed = { GreenOn, GreenOff };   // initialize the GreenLed struct




void BlueOn ( void ) {HAL_GPIO_WritePin(GPIOG, GPIO_PIN_12, GPIO_PIN_SET);}
void BlueOff ( void ) {HAL_GPIO_WritePin(GPIOG, GPIO_PIN_12, GPIO_PIN_RESET);}
LED BlueLed = { BlueOn, BlueOff }; // initialize the BlueLed struct




void RedOn ( void ) {HAL_GPIO_WritePin(GPIOG, GPIO_PIN_14, GPIO_PIN_SET);}
void RedOff ( void ) {HAL_GPIO_WritePin(GPIOG, GPIO_PIN_14, GPIO_PIN_RESET);}
LED RedLed = { RedOn, RedOff };// initialize the RedLed struct

uint8_t ReadPushButton( void ){ return HAL_GPIO_ReadPin(GPIOA, GPIO_PIN_0);}








