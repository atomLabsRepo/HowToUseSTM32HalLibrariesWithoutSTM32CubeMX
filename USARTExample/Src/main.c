/**
 * @file       : main.c, the file where main application is written
 *
 * @Exercise   : Write a program to send characters over UART from STM32 to Arduino.
 *
 * @Parameters : Peripheral                 - USART 2
 *               BuadRate                   - 115200
 *               No of data bits            - 8
 *               Stop bits                  - 1
 *               Parity                     - None
 *               Hardware flow control      - No
 *               Peripheral mode            - Asynchronous Rx mode
 *
 * @Controllers: STM32F407VGT6 and Arduino Uno
 *
 * @Connections: STM32  -   Arduino
 *               Gnd        Gnd
 *               PA2        Pin 0(Rx)
 *               PA3        Pin 1(Tx)
 *               Note: Choose connections specific to your STM32 datasheet.
 */

#include "main.h"

//Prototype of functions used
void SystemClockConfig(void);
void UART2_Init(void);
void ErrorHandler(void);

//define UART handle structure which will hold all important UART data
//Pin configurations are done in msp.c
UART_HandleTypeDef hUart2;

//This is the data to be transmitted
char *usrData = "Welcome to Atom Labs....\r\n";

int main(void)
{
	/**
	 * @fn    HAL_Init()
	 * @brief Initialize the HAL, to set NVIC priority, and lower level hardware
	 *        initializations that will be further configure in msp.c
	 */
	HAL_Init();

	UART2_Init();
	uint16_t dataLen = strlen(usrData);
	if(HAL_UART_Transmit(&hUart2, (uint8_t*)usrData, dataLen, HAL_MAX_DELAY)!= HAL_OK)
	{
		ErrorHandler();
	}

	while(1);

	return 0;
}

/**
 * @fn     UART2_Init(void)
 * @brief  Initialize UART peripheral with the application configuration.
 */
void UART2_Init(void)
{
	hUart2.Instance = USART2;
	hUart2.Init.BaudRate = 115200;
	hUart2.Init.WordLength = UART_WORDLENGTH_8B;
	hUart2.Init.StopBits = UART_STOPBITS_1;
	hUart2.Init.Parity = UART_PARITY_NONE;
	hUart2.Init.HwFlowCtl = UART_HWCONTROL_NONE;
	hUart2.Init.Mode = UART_MODE_TX_RX;
	if(HAL_UART_Init(&hUart2) != HAL_OK)
	{
		ErrorHandler();
	}
}

/**
 * @fn    ErrorHandler()
 * @brief In case, we hit an error..
 */
void ErrorHandler(void)
{
	while(1);
}
