/*
 * mainUARTPoolled.c
 *
 *  Created on: Feb 22, 2023
 *      Author: mahon
 */


#include "main.h"


/*********************************************
 * A demonstration of a polled UART driver for
 * sending and receiving
 *********************************************/


// some common variables to use for each task
// 128 * 4 = 512 bytes
//(recommended min stack size per task)
#define STACK_SIZE 128

void polledUartReceive ( void* NotUsed );
void uartPrintOutTask( void* NotUsed);

static QueueHandle_t uart1_BytesReceived = NULL;

int main(void)
{
	HWInit();
	SetupUart5ExternalSim(9600);
	SEGGER_SYSVIEW_Conf();
	HAL_NVIC_SetPriorityGrouping(NVIC_PRIORITYGROUP_4);	//ensure proper priority grouping for freeRTOS

	//setup tasks, making sure they have been properly created before moving on
	configASSERT(xTaskCreate(polledUartReceive, "polledUartRx", STACK_SIZE, NULL, tskIDLE_PRIORITY + 2, NULL) == pdPASS);
	configASSERT(xTaskCreate(uartPrintOutTask, "uartPrintTask", STACK_SIZE, NULL, tskIDLE_PRIORITY + 3, NULL) == pdPASS);

	uart1_BytesReceived = xQueueCreate(10, sizeof(char));

	//	for(int i = 0; i < 10; i++)
	//	{
	//		UART4->TDR = i;
	//		while(!(UART4->ISR & USART_ISR_TXE));
	//	}
	//start the scheduler - shouldn't return unless there's a problem
	vTaskStartScheduler();

	//if you've wound up here, there is likely an issue with overrunning the freeRTOS heap
	while(1)
	{
	}
}

void uartPrintOutTask( void* NotUsed)
{
	char nextByte;

	while(1)
	{
		xQueueReceive(uart1_BytesReceived, &nextByte, portMAX_DELAY);
		SEGGER_SYSVIEW_PrintfHost("%c", nextByte);
	}
}

/**
 * This receive task uses a queue to directly monitor
 * the USART2 peripheral.
 */
void polledUartReceive( void* NotUsed )
{
	uint8_t nextByte;
	//setup UART
	STM_UartInit(USART1, 9600, NULL, NULL);
	while(1)
	{
		while(!(USART1->ISR & USART_ISR_RXNE_Msk));
		nextByte = USART1->RDR;
		xQueueSend(uart1_BytesReceived, &nextByte, 0);
	}
}



