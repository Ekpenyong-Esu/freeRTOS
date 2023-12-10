/*
 * UARTPOOL.c
 *
 *  Created on: Mar 16, 2023
 *      Author: mahon
 */

#include <main.h>

/*********************************************
 * A demonstration of a simple receive-only block
 * based interrupt driven UART driver
 *********************************************/


// some common variables to use for each task
// 128 * 4 = 512 bytes
//(recommended min stack size per task)
#define STACK_SIZE 128


#define BAUDRATE 115200
void uartPrintOutTask( void* NotUsed);
void startUart5Traffic( TimerHandle_t xTimer );

static QueueHandle_t uart1_BytesReceived = NULL;

static bool rxInProgress = false;

int main(void)
{
	HWInit();
	SEGGER_SYSVIEW_Conf();

	//The function NVIC_SetPriorityGrouping() is used to set the priority grouping
	//value for the NVIC. The argument passed to the function is the priority grouping
	//value, which is a number from 0 to 7. The value 0 means that no preemption and sub-priority bits are used,
	//and all interrupts have the same priority level.

	//ensure proper priority grouping for freeRTOS
	NVIC_SetPriorityGrouping(0);  // This means that priority grouping is use all the systems have the same priority

	//setup a timer to kick off UART traffic (flowing out of UART5 TX line
	//and into USART2 RX line) 1 second after the scheduler starts
	//this delay is only present since we're using a simple
	//block-based buffer for receiving data - the transmission
	//needs to start after the receiver is ready for data for the
	//strings to start in the correct position in this simple setup
	TimerHandle_t oneShotHandle =
			xTimerCreate(	"startUart5Traffic",
					500 /portTICK_PERIOD_MS,
					pdFALSE,
					NULL,
					startUart5Traffic);
	assert_param(oneShotHandle != NULL);
	xTimerStart(oneShotHandle, 0);

	//setup tasks, making sure they have been properly created before moving on
	uart1_BytesReceived = xQueueCreate(10, sizeof(char));
	assert_param(uart1_BytesReceived != NULL);

	assert_param(xTaskCreate(uartPrintOutTask, "uartPrint", STACK_SIZE, NULL, tskIDLE_PRIORITY + 3, NULL) == pdPASS);

	//start the scheduler - shouldn't return unless there's a problem
	vTaskStartScheduler();

	//if you've wound up here, there is likely an issue with overrunning the freeRTOS heap
	while(1)
	{
	}
}

/**
 * Start an interrupt driven receive.  This particular ISR is hard-coded
 * to push characters into a queue
 */
void startReceiveInt( void )
{
	rxInProgress = true;
	USART1->CR3 |= USART_CR3_EIE;	//enable error interrupts
	USART1->CR1 |= (USART_CR1_UE | USART_CR1_RXNEIE);
	//all 4 bits are for preemption priority -
	NVIC_SetPriority(USART1_IRQn, 6);
	NVIC_EnableIRQ(USART1_IRQn);
}

void startUart5Traffic( TimerHandle_t xTimer )
{
	SetupUart5ExternalSim(BAUDRATE);
}

void uartPrintOutTask( void* NotUsed)
{
	char nextByte;
	STM_UartInit(USART1, BAUDRATE, NULL, NULL);
	startReceiveInt();

	while(1)
	{
		xQueueReceive(uart1_BytesReceived, &nextByte, portMAX_DELAY);
		SEGGER_SYSVIEW_PrintfHost("%c", nextByte);
	}
}

void USART1_IRQHandler( void )
{
	portBASE_TYPE xHigherPriorityTaskWoken = pdFALSE;
	SEGGER_SYSVIEW_RecordEnterISR();

	//first check for errors
	if(	USART1->SR & (	USART_SR_ORE |
			USART_SR_NE |
			USART_SR_FE |
			USART_SR_PE ))
	{
		//clear error flags
		USART1->SR &= ~(USART_SR_ORE |  // overun error
						USART_SR_NE |
						USART_SR_FE |
						USART_SR_PE);
	}

	if(	USART1->SR & USART_SR_RXNE)
	{
		//read the data register unconditionally to clear
		//the receive not empty interrupt if no reception is
		//in progress
		uint8_t tempVal = (uint8_t) USART1->DR;

		if(rxInProgress)
		{
			xQueueSendFromISR(uart1_BytesReceived, &tempVal, &xHigherPriorityTaskWoken);
		}
	}
	SEGGER_SYSVIEW_RecordExitISR();
	portYIELD_FROM_ISR(xHigherPriorityTaskWoken);
}

