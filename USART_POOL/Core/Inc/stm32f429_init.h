/*
 * stm32f429_init.h
 *
 *  Created on: Mar 16, 2023
 *      Author: mahon
 */

#ifndef INC_STM32F429_INIT_H_
#define INC_STM32F429_INIT_H_

#include <stdint.h>
#ifdef __cplusplus
 extern "C" {
#endif


void HWInit( void );
//void PWMInit( void );
uint32_t StmRand( uint32_t Max, uint32_t Min );

#ifdef __cplusplus
 }
#endif


#endif /* INC_STM32F429_INIT_H_ */
