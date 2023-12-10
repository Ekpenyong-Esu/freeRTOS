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

void wastefulTask( void* NotUsed);
void uartPrintOutTask( void* NotUsed);
void startUart5Traffic( TimerHandle_t xTimer );

static SemaphoreHandle_t rxDone = NULL;

static bool rxInProgress = false;
static uint_fast16_t rxLen = 0;
static uint8_t* rxBuff = NULL;
static uint_fast16_t rxItr = 0;


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
	rxDone = xSemaphoreCreateBinary();
	assert_param(rxDone != NULL);

	assert_param(xTaskCreate(uartPrintOutTask, "uartPrint", STACK_SIZE, NULL, tskIDLE_PRIORITY + 3, NULL) == pdPASS);
	assert_param(xTaskCreate(wastefulTask, "wastefulTask", STACK_SIZE, NULL, tskIDLE_PRIORITY + 2, NULL) == pdPASS);

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
int32_t startReceiveInt( uint8_t* Buffer, uint_fast16_t Len )
{
	if(!rxInProgress && (Buffer != NULL))
	{
		rxInProgress = true;
		rxLen = Len;
		rxBuff = Buffer;
		rxItr = 0;
		USART1->CR3 |= USART_CR3_EIE;	//enable error interrupts
		USART1->CR1 |= (USART_CR1_UE | USART_CR1_RXNEIE);
		//all 4 bits are for preemption priority -
		NVIC_SetPriority(USART1_IRQn, 6);
		NVIC_EnableIRQ(USART1_IRQn);
		return 0;
	}

	return -1;
}



void startUart5Traffic( TimerHandle_t xTimer )
{
	SetupUart5ExternalSim(9600);
}



void wastefulTask( void* NotUsed)
{
	while(1)
	{
		volatile int i, j;
		i = 10;
		j = i;
		i = j;
	}
}


void uartPrintOutTask( void* NotUsed)
{
	uint8_t rxData[20];
	uint8_t expectedLen = 16;
	memset((void*)rxData, 0, 20);

	STM_UartInit(USART1, 9600, NULL, NULL);
	while(1)
	{
		startReceiveInt(rxData, expectedLen);
		if(xSemaphoreTake(rxDone, 100) == pdPASS)
		{
			if(expectedLen == rxItr)
			{
				SEGGER_SYSVIEW_PrintfHost("received: ");
				SEGGER_SYSVIEW_Print((char*)rxData);
			}
			else
			{
				SEGGER_SYSVIEW_PrintfHost("expected %i bytes received %i", expectedLen, rxItr);
			}
		}
		else
		{
			SEGGER_SYSVIEW_PrintfHost("timeout");
		}
	}
}

void USART1_IRQHandler( void )
{
	portBASE_TYPE xHigherPriorityTaskWoken = pdFALSE;
	SEGGER_SYSVIEW_RecordEnterISR();

	//first check for errors
	if(	USART1->SR & (	USART_SR_ORE_Msk |
			USART_SR_NE_Msk |
			USART_SR_FE_Msk |
			USART_SR_PE_Msk ))
	{
		//clear error flags
		USART1->SR &= ~(USART_SR_ORE |  // overun error
						USART_SR_NE |
						USART_SR_FE |
						USART_SR_PE);

		//if a transfer was in progress, cancel it
		//if a function pointer-based callback is used instead
		//of a semaphore, an error flag could be sent directly
		//through the function call.  With this semaphore approach,
		//the closest thing we can do is set an external error flag
		//or explicitly check the number of received bytes
		if(rxInProgress)
		{
			rxInProgress = false;
			xSemaphoreGiveFromISR(rxDone, &xHigherPriorityTaskWoken);
		}
	}

	if(	USART1->SR & USART_SR_RXNE_Msk)
	{
		//read the data register unconditionally to clear
		//the receive not empty interrupt if no reception is
		//in progress
		uint8_t tempVal = (uint8_t) USART1->DR;

		if(rxInProgress)
		{
			rxBuff[rxItr++] = tempVal;
			if(rxItr >= rxLen)
			{
				rxInProgress = false;
				xSemaphoreGiveFromISR(rxDone, &xHigherPriorityTaskWoken);
			}
		}
	}
	portYIELD_FROM_ISR(xHigherPriorityTaskWoken);
	SEGGER_SYSVIEW_RecordExitISR();
}


