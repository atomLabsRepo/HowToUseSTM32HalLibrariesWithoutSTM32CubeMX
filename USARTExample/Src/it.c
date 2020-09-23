/**
 * @file       : it.c, for interrupt configurations
 */
#include "main.h"

/**
 * @fn    :SysTick_Handler()
 * @brief :Contains peripheral functions
 */
void SysTick_Handler(void)
{
	HAL_IncTick();
	HAL_SYSTICK_IRQHandler();
}
