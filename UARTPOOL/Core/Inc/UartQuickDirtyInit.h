/*
 * UartQuickDirtyInit.h
 *
 *  Created on: Feb 22, 2023
 *      Author: mahon
 */

#ifndef INC_UARTQUICKDIRTYINIT_H_
#define INC_UARTQUICKDIRTYINIT_H_
#include "main.h"

void STM_UartInit( USART_TypeDef* STM_UART_PERIPH, uint32_t Baudrate, DMA_HandleTypeDef* DmaTx, DMA_HandleTypeDef* DmaRx );



#endif /* INC_UARTQUICKDIRTYINIT_H_ */
