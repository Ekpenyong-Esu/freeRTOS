/*
 * Uart5Setup.c
 *
 *  Created on: Feb 22, 2023
 *      Author: mahon
 */

#include "main.h"



//static const uint8_t UART5Msg[] = "0123456789abcdefghijklmnopqrstuvwxyz";
static const uint8_t UART5Msg[] = "data from uart5";
static DMA_HandleTypeDef hdma_uart5_tx;

static void uart5TxDmaStartRepeat( const uint8_t* Msg, uint16_t Len );
static void uart5TxDmaSetup( void );

/**
 * Setup UART5 to repeatedly transmit a message
 * via DMA (no CPU intervention required).  This simulates
 * what would happen if there was data flowing from an
 * external off-chip source and let's us concentrate on
 * what's going on with UART2
 *
 * @param Baudrate desired baudrate for the UART5
 *
 * This is a quick and dirty setup. . .
 */
void SetupUart5ExternalSim( uint32_t BaudRate )
{
	//setup DMA
	uart5TxDmaSetup();

	//GPIO pins are setup in BSP/Nucleo_F767ZI_Init
	STM_UartInit(UART5, BaudRate, &hdma_uart5_tx, NULL);

	//also enable DMA for UART5 Transmits
	UART5->CR3 |= USART_CR3_DMAT_Msk;

	/**
	 *	start the repeating DMA transfer.  Eventually, non-circular
	 *	receivers will loose a character here or there at high baudrates.
	 *	When this happens, SEGGER_SYSVIEW_Print() will stop printing when it hits
	 *	the first NULL character.
	 */
	uart5TxDmaStartRepeat(UART5Msg, sizeof(UART5Msg));
}

static void uart5TxDmaSetup( void )
{
	__HAL_RCC_DMA1_CLK_ENABLE();
	//no need to enable any interrupts
	HAL_NVIC_SetPriority(DMA1_Stream7_IRQn, 0, 0);
	HAL_NVIC_EnableIRQ(DMA1_Stream7_IRQn);

	//initialize the DMA peripheral to transfer UART5Msg
	//to UART5 repeatedly
	memset(&hdma_uart5_tx, 0, sizeof(hdma_uart5_tx));
	hdma_uart5_tx.Instance = DMA1_Stream7;
	hdma_uart5_tx.Init.Channel = DMA_CHANNEL_4;			//channel 4 is for UART5 Tx
	hdma_uart5_tx.Init.Direction = DMA_MEMORY_TO_PERIPH;	//transfering out of memory and into the peripheral register
	hdma_uart5_tx.Init.FIFOMode = DMA_FIFOMODE_DISABLE;	//no fifo
	hdma_uart5_tx.Init.MemBurst = DMA_MBURST_SINGLE;		//transfer 1 at a time
	hdma_uart5_tx.Init.MemDataAlignment = DMA_MDATAALIGN_BYTE;
	hdma_uart5_tx.Init.MemInc = DMA_MINC_ENABLE;			//increment 1 byte at a time
	hdma_uart5_tx.Init.Mode = DMA_CIRCULAR;				//this will automatically restart the transfer at the beginning after it has finished
	hdma_uart5_tx.Init.PeriphBurst = DMA_PBURST_SINGLE;	//write 1 at a time to the peripheral
	hdma_uart5_tx.Init.PeriphInc = DMA_PINC_DISABLE;		//always keep the peripheral address the same (the Tx data register is always in the same location)
	hdma_uart5_tx.Init.PeriphDataAlignment = DMA_PDATAALIGN_BYTE;
	//we're setting low priority since this is meant to be simulated data - the DMA
	//transfers of the active code should take priority
	hdma_uart5_tx.Init.Priority = DMA_PRIORITY_VERY_HIGH;
	configASSERT(HAL_DMA_Init(&hdma_uart5_tx) == HAL_OK);
	DMA1_Stream7 ->CR &= ~DMA_SxCR_EN;

	//set the DMA transmit mode flag to enable DMA transfers
	UART5->CR3 |= USART_CR3_DMAT_Msk;
}

/**
 * starts a DMA transfer to the UART5 Tx register
 * that will automatically repeat after it is finished
 * @param Msg pointer to array to transfer
 * @param Len number of elements in the array
 */
static void uart5TxDmaStartRepeat( const uint8_t* Msg, uint16_t Len )
{
	//clear the transfer complete flag to make sure our transfer starts
	UART5->ICR |= USART_ICR_TCCF;
	configASSERT(HAL_DMA_Start(&hdma_uart5_tx, (uint32_t) Msg, (uint32_t)&(UART5->TDR), Len) == HAL_OK);
}

void DMA1_Stream7_IRQHandler(void)
{
	//shouldn't ever get here - interrupts are not enabled
	while(1);
//  HAL_DMA_IRQHandler(&hdma_UART5_tx);
}

