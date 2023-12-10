/*
 * UartQuickDirtyInit.h
 *
 *  Created on: Mar 16, 2023
 *      Author: mahon
 */

#ifndef INC_UARTSETUP_H_
#define INC_UARTSETUP_H_

#ifdef __cplusplus
 extern "C" {
#endif

#include <stm32f4xx_hal.h>

void STM_UartInit( USART_TypeDef* STM_UART_PERIPH, uint32_t Baudrate, DMA_HandleTypeDef* DmaTx, DMA_HandleTypeDef* DmaRx );

#ifdef __cplusplus
 }
#endif

#endif /* INC_UARTSETUP_H_ */
