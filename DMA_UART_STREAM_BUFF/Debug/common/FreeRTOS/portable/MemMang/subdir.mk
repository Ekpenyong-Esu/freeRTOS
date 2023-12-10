################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../common/FreeRTOS/portable/MemMang/heap_4.c 

OBJS += \
./common/FreeRTOS/portable/MemMang/heap_4.o 

C_DEPS += \
./common/FreeRTOS/portable/MemMang/heap_4.d 


# Each subdirectory must supply rules for building sources it contributes
common/FreeRTOS/portable/MemMang/%.o common/FreeRTOS/portable/MemMang/%.su: ../common/FreeRTOS/portable/MemMang/%.c common/FreeRTOS/portable/MemMang/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F429xx -DUSE_FULL_ASSERT=1 -c -I"C:/Users/mahon/stmWork/freeRTOS/DMA_UART_STREAM_BUFF/common/FreeRTOS/include" -I"C:/Users/mahon/stmWork/freeRTOS/DMA_UART_STREAM_BUFF/common/FreeRTOS/portable/GCC/ARM_CM4F" -I"C:/Users/mahon/stmWork/freeRTOS/DMA_UART_STREAM_BUFF/common/SEGGER/config" -I"C:/Users/mahon/stmWork/freeRTOS/DMA_UART_STREAM_BUFF/common/SEGGER/os" -I"C:/Users/mahon/stmWork/freeRTOS/DMA_UART_STREAM_BUFF/common/SEGGER/SEGGER" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-common-2f-FreeRTOS-2f-portable-2f-MemMang

clean-common-2f-FreeRTOS-2f-portable-2f-MemMang:
	-$(RM) ./common/FreeRTOS/portable/MemMang/heap_4.d ./common/FreeRTOS/portable/MemMang/heap_4.o ./common/FreeRTOS/portable/MemMang/heap_4.su

.PHONY: clean-common-2f-FreeRTOS-2f-portable-2f-MemMang

