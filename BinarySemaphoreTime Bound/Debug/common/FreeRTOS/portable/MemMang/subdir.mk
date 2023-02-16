################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/mahon/stmWork/freeRTOS/common/FreeRTOS/portable/MemMang/heap_4.c 

OBJS += \
./common/FreeRTOS/portable/MemMang/heap_4.o 

C_DEPS += \
./common/FreeRTOS/portable/MemMang/heap_4.d 


# Each subdirectory must supply rules for building sources it contributes
common/FreeRTOS/portable/MemMang/heap_4.o: C:/Users/mahon/stmWork/freeRTOS/common/FreeRTOS/portable/MemMang/heap_4.c common/FreeRTOS/portable/MemMang/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F429xx -c -I"C:/Users/mahon/stmWork/freeRTOS/common/FreeRTOS/portable/GCC/ARM_CM4F" -I"C:/Users/mahon/stmWork/freeRTOS/common/FreeRTOS/include" -I"C:/Users/mahon/stmWork/freeRTOS/common/SEGGER/config" -I"C:/Users/mahon/stmWork/freeRTOS/common/SEGGER/SEGGER" -I"C:/Users/mahon/stmWork/freeRTOS/common/SEGGER/os" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-common-2f-FreeRTOS-2f-portable-2f-MemMang

clean-common-2f-FreeRTOS-2f-portable-2f-MemMang:
	-$(RM) ./common/FreeRTOS/portable/MemMang/heap_4.d ./common/FreeRTOS/portable/MemMang/heap_4.o ./common/FreeRTOS/portable/MemMang/heap_4.su

.PHONY: clean-common-2f-FreeRTOS-2f-portable-2f-MemMang

