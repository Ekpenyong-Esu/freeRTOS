################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../common/SEGGER/os/SEGGER_SYSVIEW_FreeRTOS.c 

OBJS += \
./common/SEGGER/os/SEGGER_SYSVIEW_FreeRTOS.o 

C_DEPS += \
./common/SEGGER/os/SEGGER_SYSVIEW_FreeRTOS.d 


# Each subdirectory must supply rules for building sources it contributes
common/SEGGER/os/%.o common/SEGGER/os/%.su: ../common/SEGGER/os/%.c common/SEGGER/os/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F429xx -DUSE_FULL_ASSERT=1 -c -I"C:/Users/mahon/stmWork/freeRTOS/USART_INT_QUE/common/FreeRTOS/include" -I"C:/Users/mahon/stmWork/freeRTOS/USART_INT_QUE/common/FreeRTOS/portable/GCC/ARM_CM4F" -I"C:/Users/mahon/stmWork/freeRTOS/USART_INT_QUE/common/SEGGER/config" -I"C:/Users/mahon/stmWork/freeRTOS/USART_INT_QUE/common/SEGGER/os" -I"C:/Users/mahon/stmWork/freeRTOS/USART_INT_QUE/common/SEGGER/SEGGER" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-common-2f-SEGGER-2f-os

clean-common-2f-SEGGER-2f-os:
	-$(RM) ./common/SEGGER/os/SEGGER_SYSVIEW_FreeRTOS.d ./common/SEGGER/os/SEGGER_SYSVIEW_FreeRTOS.o ./common/SEGGER/os/SEGGER_SYSVIEW_FreeRTOS.su

.PHONY: clean-common-2f-SEGGER-2f-os

