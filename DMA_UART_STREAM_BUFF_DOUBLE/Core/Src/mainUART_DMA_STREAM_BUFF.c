/*
 * UARTPOOL.c
 *
 *  Created on: Mar 16, 2023
 *      Author: mahon
 */

#include <main.h>
/*********************************************
 * A demonstration of a simple receive-only stream buffer
 * UART driver implementation through DMA
 *********************************************/


// some common variables to use for each task
// 128 * 4 = 512 bytes
//(recommended min stack size per task)

#define STACK_SIZE 128
//9600 - no errors
//115200 - no errors
//230400 - no errors
//256400 - no errors
//460800 - hit or miss, some corrupt data
//512800 - hit or miss, some corrupt data
#define BAUDRATE (115200)


void uartPrintOutTask( void* NotUsed);
void startUart5Traffic( TimerHandle_t xTimer );

//NOTE: keep buffers < 1KB to simplify DMA implementation
//see 8.3.12 for details
#define RX_BUFF_LEN 16
static uint8_t rxData1[RX_BUFF_LEN];
static uint8_t rxData2[RX_BUFF_LEN];

static StreamBufferHandle_t rxStream = NULL;

static bool rxInProgress = false;

static DMA_HandleTypeDef usart1DmaRx;

int main()
{


	HWInit();
	SEGGER_SYSVIEW_Conf();

	//ensure proper priority grouping for freeRTOS
	NVIC_SetPriorityGrouping(0);

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
	rxStream = xStreamBufferCreate( 100, 1);
	assert_param(rxStream != NULL);

	assert_param(xTaskCreate(uartPrintOutTask, "uartPrint", STACK_SIZE, NULL, tskIDLE_PRIORITY + 3, NULL) == pdPASS);

	//start the scheduler - shouldn't return unless there's a problem
	vTaskStartScheduler();

	//if you've wound up here, there is likely an issue with overrunning the freeRTOS heap
	while(1)
	{
	}

}
	/**
	 * sets up DMA for USART2 reception into a single buffer.
	 */
void setupUSART1DMA_circular( void )
{

	__HAL_RCC_DMA2_CLK_ENABLE();

	NVIC_SetPriority(DMA2_Stream5_IRQn, 6);
	NVIC_EnableIRQ(DMA2_Stream5_IRQn);


	//initialize the DMA peripheral to transfer uart4Msg
	//to UART5 repeatedly
	memset(&usart1DmaRx, 0, sizeof(usart1DmaRx));

	/* USART1 DMA Init */
	/* USART1_RX Init */
//	usart1DmaRx.Instance = DMA2_Stream5;     //stream 5 is for USART1 Rx
//	usart1DmaRx.Init.Channel = DMA_CHANNEL_4;  //channel 4 is for USART1 Rx/Tx
//	usart1DmaRx.Init.Direction = DMA_PERIPH_TO_MEMORY;  //transfering out of memory and into the peripheral register
//	usart1DmaRx.Init.PeriphInc = DMA_PINC_DISABLE;		//always keep the peripheral address the same (the RX data register is always in the same location)
//	//usart1DmaRx.Init.MemBurst = DMA_MBURST_SINGLE;		//transfer 1 at a time
//	usart1DmaRx.Init.MemInc = DMA_MINC_ENABLE;			//increment 1 byte at a time
//	usart1DmaRx.Init.PeriphDataAlignment = DMA_PDATAALIGN_BYTE;
//	usart1DmaRx.Init.MemDataAlignment = DMA_MDATAALIGN_BYTE;
//	usart1DmaRx.Init.Mode = DMA_NORMAL;							//flow control mode set to normal
//	usart1DmaRx.Init.Priority = DMA_PRIORITY_LOW;
//	usart1DmaRx.Init.FIFOMode = DMA_FIFOMODE_DISABLE;			//no fifo
//	//usart1DmaRx.Init.PeriphBurst = DMA_PBURST_SINGLE;			//write 1 at a time to the peripheral
//	if (HAL_DMA_Init(&usart1DmaRx) != HAL_OK)
//	{
//		Error_Handler();
//	}


 /* USART1_RX Init */
	usart1DmaRx.Instance = DMA2_Stream5;
	usart1DmaRx.Init.Channel = DMA_CHANNEL_4;
	usart1DmaRx.Init.Direction = DMA_PERIPH_TO_MEMORY;
	usart1DmaRx.Init.PeriphInc = DMA_PINC_DISABLE;
	usart1DmaRx.Init.MemInc = DMA_MINC_ENABLE;
	usart1DmaRx.Init.PeriphDataAlignment = DMA_PDATAALIGN_BYTE;
	usart1DmaRx.Init.MemDataAlignment = DMA_MDATAALIGN_BYTE;
	usart1DmaRx.Init.Mode = DMA_CIRCULAR;
	usart1DmaRx.Init.Priority = DMA_PRIORITY_HIGH;
	usart1DmaRx.Init.FIFOMode = DMA_FIFOMODE_DISABLE;
	usart1DmaRx.Init.PeriphBurst = DMA_PBURST_SINGLE;		//write 1 at a time to the peripheral
	usart1DmaRx.Init.MemBurst = DMA_MBURST_SINGLE;		//transfer 1 at a time
	if (HAL_DMA_Init(&usart1DmaRx) != HAL_OK)
	{
	  Error_Handler();
	}

	DMA2_Stream5->CR |= DMA_SxCR_TCIE;	//enable transfer complete interrupts
	//USART1->CR3 |= USART_CR3_DMAR; //  USART_CR3_DMAR_Msk;	//set the DMA receive mode flag in the USART
}

/**
 * Start an interrupt driven receive.  This particular ISR is hard-coded
 * to give a semaphore when the reception is finished
 */
int32_t startCircularReceiveDMA( void )
{
	rxInProgress = true;

	//get the DMA peripheral ready to receive data immediately before enabling UART
	__HAL_DMA_DISABLE(&usart1DmaRx);
	setupUSART1DMA_circular();

	//setup second address for double buffered mode
	DMA2_Stream5->M1AR = (uint32_t) rxData2;

	//NOTE: HAL_DMA_Start explicitly disables double buffer mode
	//			so we'll explicitly enable double buffer mode later when
	//			the actual transfer is started
	if(HAL_DMA_Start(&usart1DmaRx, (uint32_t)&(USART1->DR), (uint32_t)rxData1, RX_BUFF_LEN) != HAL_OK)
	{
		return -1;
	}

	//disable the stream and controller so we can setup dual buffers
	__HAL_DMA_DISABLE(&usart1DmaRx);
	//set the double buffer mode
	DMA2_Stream5->CR |= DMA_SxCR_DBM;
	//re-enable the stream and controller
	__HAL_DMA_ENABLE(&usart1DmaRx);
	DMA2_Stream5->CR |= DMA_SxCR_EN;

	//for this specific instance, we'll avoid enabling UART interrupts for errors since
	//we'll wind up with a lot of noise on the line (the way the ISR is written will
	//cause a transfer to terminate if there are any errors are detected, rather than simply
	//continue with what data it can).  In practice, most of the "errors" at baudrates below
	//460800 are noise detection
	//		USART2->CR3 |= (USART_CR3_EIE);	//enable error interrupts
	return 0;
}



void startUart5Traffic( TimerHandle_t xTimer )
{
	SetupUart5ExternalSim(BAUDRATE);
}

void stopReceiveDMA( void )
{
	rxInProgress = false;
	HAL_DMA_Abort(&usart1DmaRx);
}


void uartPrintOutTask( void* NotUsed)
{
	static const uint8_t maxBytesReceived = 16;
	uint8_t rxBufferedData[maxBytesReceived];

	//setup double buffer mode for receiving via DMA into dual buffers
	//that are automatically switched by the DMA hardware
	startCircularReceiveDMA();
	//next, setup USART1
	STM_UartInit(USART1, BAUDRATE, NULL, &usart1DmaRx);

	//enable DMA reception mode
	USART1->CR3 |= USART_CR3_DMAR;

	//clears error flags
	//clear error flags
	USART1->SR &= ~(USART_SR_ORE |  // overun error
					USART_SR_NE |
					USART_SR_FE |
					USART_SR_PE);

	NVIC_SetPriority(USART1_IRQn, 6);
	NVIC_EnableIRQ(USART1_IRQn);
	USART1->CR1 |= (USART_CR1_UE);

	while(1)
	{
		//fill a local buffer with 0's to make it easier to print
		memset(rxBufferedData, 0, 20);
		uint8_t numBytes = xStreamBufferReceive(	rxStream,
				rxBufferedData,
				maxBytesReceived,
				100 );
		if(numBytes > 0)
		{
			SEGGER_SYSVIEW_PrintfHost("received: ");
			SEGGER_SYSVIEW_Print((char*)rxBufferedData);
		}
		else
		{
			SEGGER_SYSVIEW_PrintfHost("timeout");
		}
	}
}

/**
 * Given the DMA setup performed by setupUSART2DMA
 * this ISR will only execute when a DMA transfer is complete
 * Each time a transfer is completed, DMA peripheral will
 * automatically start writing to the opposite buffer (for example
 * the controller will initially be writing to the buffer
 * specified in DMA1_Stream5->M0AR.  After this buffer is filled
 * the DMA controller will start writing to the buffer i n
 * DMA1_Stream5->M1AR.
 *
 */
void DMA2_Stream5_IRQHandler(void)
{
	uint16_t numWritten = 0;
	uint8_t* currBuffPtr = NULL;


	portBASE_TYPE xHigherPriorityTaskWoken = pdFALSE;
	SEGGER_SYSVIEW_RecordEnterISR();

	if(rxInProgress && (DMA2->HISR & DMA_HISR_TCIF5))
	{

		//push data from the correct raw memory buffer into
		//the freeRTOS stream buffer
		//the DMA_SxCR_CT bit indicates the "Current Target"
		//which is either DMA_SxM0AR or DMA_SxM1AR
		//see section 8.5.5 for details on the CT bit of
		//the DMA_SxCR register
		if(DMA2_Stream5->CR & DMA_SxCR_CT)
		{
			currBuffPtr = rxData1;
		}
		else
		{
			currBuffPtr = rxData2;
		}

		//if there is something to add to the queue, do so
		//(don't call xStreamBuferSendFromISR with a length of 0)
		numWritten = xStreamBufferSendFromISR(	rxStream,
				currBuffPtr,
				RX_BUFF_LEN,
				&xHigherPriorityTaskWoken);

		//OH NO - not everything was written to the stream
		//if this is catastrophic, do something drastic!
		while(numWritten != RX_BUFF_LEN);

		DMA2->HIFCR |= DMA_HIFCR_CTCIF5;
	}
	SEGGER_SYSVIEW_RecordExitISR();
	portYIELD_FROM_ISR(xHigherPriorityTaskWoken);
}


/**
 * This ISR should only execute when there is an error
 */
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

	}

	//there is no need to check receive not empty, since
	//receive interrupt requests are triggering transfers
	//through DMA1 channel 4 stream 5
	//	if(	USART2->ISR & USART_ISR_RXNE_Msk)

	SEGGER_SYSVIEW_RecordExitISR();
	portYIELD_FROM_ISR(xHigherPriorityTaskWoken);
}

