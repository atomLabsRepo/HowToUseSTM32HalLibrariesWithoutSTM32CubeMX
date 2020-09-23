/**
 * @file       : msp.c, the file where main application is written
 * @brief      : MSP stands for Micro-controller Specific Programming. This file contains lower
 *               level settings for the controller.
 */

#include "main.h"

void HAL_MspInit(void)
{
  /**
   * @brief Here we will lower level initializations
   *        1) Setup priority grouping of the arm cortex mx processor
   *        2) Enable the required system exceptions of ARM cortex MX processor.
   *        3) Configure the priority for system exception.
   */
	HAL_NVIC_SetPriorityGrouping(NVIC_PRIORITYGROUP_4);

	SCB->SHCSR |= 0x7 << 16; //usage fault, memory fault and bus fault system exceptions

	HAL_NVIC_SetPriority(MemoryManagement_IRQn, 0, 0);
	HAL_NVIC_SetPriority(BusFault_IRQn, 0, 0);
	HAL_NVIC_SetPriority(UsageFault_IRQn, 0, 0);
}

void HAL_UART_MspInit(UART_HandleTypeDef *huart)
{
	/**
	 * @brief Here we will lower level initializations for UART 2 peripheral
	 *        1) Enable the clock for USART and GPIO peripheral
	 *        2) Do the pin muxing configurations i.e. allocate GPIOs for UART Rx and Tx
	 *        3) Enable the IRQ and setup the priority (NVIC settings)
	 */

	GPIO_InitTypeDef gpioUART;

	__HAL_RCC_USART2_CLK_ENABLE();
	__HAL_RCC_GPIOA_CLK_ENABLE();

	gpioUART.Pin = GPIO_PIN_2;//UART2_TX
	gpioUART.Mode = GPIO_MODE_AF_PP;
	gpioUART.Pull = GPIO_PULLUP;
	gpioUART.Speed = GPIO_SPEED_FREQ_LOW;
	gpioUART.Alternate = GPIO_AF7_USART2;

	HAL_GPIO_Init(GPIOA, &gpioUART);

	gpioUART.Pin = GPIO_PIN_3;//UART2_RX
	HAL_GPIO_Init(GPIOA, &gpioUART);

	HAL_NVIC_EnableIRQ(USART2_IRQn);
	HAL_NVIC_SetPriority(USART2_IRQn, 15, 0);
}
