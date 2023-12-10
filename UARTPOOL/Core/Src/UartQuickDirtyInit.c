/*
 * UartQuickDirtyInit.c
 *
 *  Created on: Feb 22, 2023
 *      Author: mahon
 */

#include "UartQuickDirtyInit.h"


/**
 * MIT License
 *
 * Copyright (c) 2019 Brian Amos
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *
 */


#include "main.h"

void initUart1Pins( void )
{
	GPIO_InitTypeDef GPIO_InitStruct = {0};

	// is USART1_RX
	GPIO_InitStruct.Pin = GPIO_PIN_9 | GPIO_PIN_10;
	GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Alternate = GPIO_AF7_USART1;
	HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);
}

void initUart5Pin( void )
{
	GPIO_InitTypeDef GPIO_InitStruct = {0};

	//PC12 is UART4_TX
	GPIO_InitStruct.Pin = GPIO_PIN_12;
	GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Alternate = GPIO_AF8_UART5;
	HAL_GPIO_Init(GPIOC, &GPIO_InitStruct);



	GPIO_InitStruct.Pin = GPIO_PIN_2;
	GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Alternate = GPIO_AF8_UART5;
	HAL_GPIO_Init(GPIOD, &GPIO_InitStruct);
}



/**
 * Initialize the selected UART specified baudrate
 *	- enables peripheral clock
 *	- sets up default modes useful to us
 *
 *	NOTE:   If using DMA, the DmaTx or DmaRx pointers need to be pointing
 *			to valid  DMA_HandleTypeDef and the DMA peripheral should be
 *			initialized prior to calling this function
 * @param STM_UART_PERIPH STM32 peripheral name for the UART to initialize
 * @param Baudrate desired baudrate the UART will be setup to use
 * @param DmaTx pointer to DMA struct to use when transmitting via DMA
 * @param DmaRx pointer to DMA struct to use when receiving via DMA
 */
void STM_UartInit( USART_TypeDef* STM_UART_PERIPH, uint32_t Baudrate, DMA_HandleTypeDef* DmaTx, DMA_HandleTypeDef* DmaRx )
{
	HAL_StatusTypeDef retVal;
	UART_HandleTypeDef uartInitStruct;
    configASSERT(STM_UART_PERIPH == USART1 || STM_UART_PERIPH == UART5);

    if(STM_UART_PERIPH == USART1)
	{
        initUart1Pins();
        __USART1_CLK_ENABLE();
	}
	else if (STM_UART_PERIPH == UART5)
	{
		initUart5Pin();
        __UART5_CLK_ENABLE();
	}

	uartInitStruct.Instance = STM_UART_PERIPH;
	uartInitStruct.Init.BaudRate = Baudrate;
	uartInitStruct.Init.WordLength = UART_WORDLENGTH_8B;
	uartInitStruct.Init.StopBits = UART_STOPBITS_1;
	uartInitStruct.Init.Parity = UART_PARITY_NONE;
	uartInitStruct.Init.Mode = UART_MODE_TX_RX;
	uartInitStruct.Init.HwFlowCtl = UART_HWCONTROL_NONE;
	uartInitStruct.Init.OverSampling = UART_OVERSAMPLING_8;
	//uartInitStruct.Init.OneBitSampling = UART_ONE_BIT_SAMPLE_DISABLE;
	uartInitStruct.hdmatx = DmaTx;
	uartInitStruct.hdmarx = DmaRx;
	//uartInitStruct.AdvancedInit.AdvFeatureInit = UART_ADVFEATURE_NO_INIT;

	retVal = HAL_UART_Init(&uartInitStruct);
    configASSERT(retVal == HAL_OK);
}