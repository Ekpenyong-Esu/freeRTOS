################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/mahon/stmWork/New\ folder/common/FreeRTOS/portable/GCC/ARM_CM4F/port.c 

OBJS += \
./common/FreeRTOS/portable/GCC/ARM_CM4F/port.o 

C_DEPS += \
./common/FreeRTOS/portable/GCC/ARM_CM4F/port.d 


# Each subdirectory must supply rules for building sources it contributes
common/FreeRTOS/portable/GCC/ARM_CM4F/port.o: C:/Users/mahon/stmWork/New\ folder/common/FreeRTOS/portable/GCC/ARM_CM4F/port.c common/FreeRTOS/portable/GCC/ARM_CM4F/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g -DDEBUG -DUSE_HAL_DRIVER -DSTM32F429xx -c -I"C:/Users/mahon/stmWork/New folder/common/FreeRTOS/include" -I"C:/Users/mahon/stmWork/New folder/common/FreeRTOS/portable/GCC/ARM_CM4F" -I"C:/Users/mahon/stmWork/New folder/common/SEGGER/config" -I"C:/Users/mahon/stmWork/New folder/common/SEGGER/os" -I"C:/Users/mahon/stmWork/New folder/common/SEGGER/SEGGER" -I../Drivers/CMSIS/Include -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-common-2f-FreeRTOS-2f-portable-2f-GCC-2f-ARM_CM4F

clean-common-2f-FreeRTOS-2f-portable-2f-GCC-2f-ARM_CM4F:
	-$(RM) ./common/FreeRTOS/portable/GCC/ARM_CM4F/port.d ./common/FreeRTOS/portable/GCC/ARM_CM4F/port.o ./common/FreeRTOS/portable/GCC/ARM_CM4F/port.su

.PHONY: clean-common-2f-FreeRTOS-2f-portable-2f-GCC-2f-ARM_CM4F

