################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Src/it.c \
../Src/main.c \
../Src/msp.c \
../Src/syscalls.c \
../Src/sysmem.c \
../Src/system_stm32f4xx.c 

OBJS += \
./Src/it.o \
./Src/main.o \
./Src/msp.o \
./Src/syscalls.o \
./Src/sysmem.o \
./Src/system_stm32f4xx.o 

C_DEPS += \
./Src/it.d \
./Src/main.d \
./Src/msp.d \
./Src/syscalls.d \
./Src/sysmem.d \
./Src/system_stm32f4xx.d 


# Each subdirectory must supply rules for building sources it contributes
Src/it.o: ../Src/it.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DSTM32 -DSTM32F407G_DISC1 -DSTM32F4 -DSTM32F407VGTx -DDEBUG -DUSE_HAL_DRIVER -c -I../Inc -I"D:/WorkspaceForAtomaxRepo/USARTExample/Drivers/CMSIS/Device" -I"D:/WorkspaceForAtomaxRepo/USARTExample/Drivers/CMSIS/Include" -I"D:/WorkspaceForAtomaxRepo/USARTExample/Drivers/STM32F4xx_HAL_Driver/Inc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Src/it.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Src/main.o: ../Src/main.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DSTM32 -DSTM32F407G_DISC1 -DSTM32F4 -DSTM32F407VGTx -DDEBUG -DUSE_HAL_DRIVER -c -I../Inc -I"D:/WorkspaceForAtomaxRepo/USARTExample/Drivers/CMSIS/Device" -I"D:/WorkspaceForAtomaxRepo/USARTExample/Drivers/CMSIS/Include" -I"D:/WorkspaceForAtomaxRepo/USARTExample/Drivers/STM32F4xx_HAL_Driver/Inc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Src/main.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Src/msp.o: ../Src/msp.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DSTM32 -DSTM32F407G_DISC1 -DSTM32F4 -DSTM32F407VGTx -DDEBUG -DUSE_HAL_DRIVER -c -I../Inc -I"D:/WorkspaceForAtomaxRepo/USARTExample/Drivers/CMSIS/Device" -I"D:/WorkspaceForAtomaxRepo/USARTExample/Drivers/CMSIS/Include" -I"D:/WorkspaceForAtomaxRepo/USARTExample/Drivers/STM32F4xx_HAL_Driver/Inc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Src/msp.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Src/syscalls.o: ../Src/syscalls.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DSTM32 -DSTM32F407G_DISC1 -DSTM32F4 -DSTM32F407VGTx -DDEBUG -DUSE_HAL_DRIVER -c -I../Inc -I"D:/WorkspaceForAtomaxRepo/USARTExample/Drivers/CMSIS/Device" -I"D:/WorkspaceForAtomaxRepo/USARTExample/Drivers/CMSIS/Include" -I"D:/WorkspaceForAtomaxRepo/USARTExample/Drivers/STM32F4xx_HAL_Driver/Inc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Src/syscalls.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Src/sysmem.o: ../Src/sysmem.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DSTM32 -DSTM32F407G_DISC1 -DSTM32F4 -DSTM32F407VGTx -DDEBUG -DUSE_HAL_DRIVER -c -I../Inc -I"D:/WorkspaceForAtomaxRepo/USARTExample/Drivers/CMSIS/Device" -I"D:/WorkspaceForAtomaxRepo/USARTExample/Drivers/CMSIS/Include" -I"D:/WorkspaceForAtomaxRepo/USARTExample/Drivers/STM32F4xx_HAL_Driver/Inc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Src/sysmem.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Src/system_stm32f4xx.o: ../Src/system_stm32f4xx.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DSTM32 -DSTM32F407G_DISC1 -DSTM32F4 -DSTM32F407VGTx -DDEBUG -DUSE_HAL_DRIVER -c -I../Inc -I"D:/WorkspaceForAtomaxRepo/USARTExample/Drivers/CMSIS/Device" -I"D:/WorkspaceForAtomaxRepo/USARTExample/Drivers/CMSIS/Include" -I"D:/WorkspaceForAtomaxRepo/USARTExample/Drivers/STM32F4xx_HAL_Driver/Inc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Src/system_stm32f4xx.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

