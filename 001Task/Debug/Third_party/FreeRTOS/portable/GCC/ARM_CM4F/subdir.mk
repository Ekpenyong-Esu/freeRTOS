################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Third_party/FreeRTOS/portable/GCC/ARM_CM4F/port.c 

OBJS += \
./Third_party/FreeRTOS/portable/GCC/ARM_CM4F/port.o 

C_DEPS += \
./Third_party/FreeRTOS/portable/GCC/ARM_CM4F/port.d 


# Each subdirectory must supply rules for building sources it contributes
Third_party/FreeRTOS/portable/GCC/ARM_CM4F/%.o Third_party/FreeRTOS/portable/GCC/ARM_CM4F/%.su: ../Third_party/FreeRTOS/portable/GCC/ARM_CM4F/%.c Third_party/FreeRTOS/portable/GCC/ARM_CM4F/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g -DDEBUG -DUSE_HAL_DRIVER -DSTM32F429xx -c -I"C:/Users/mahon/stmWork/New folder/common/FreeRTOS/include" -I"C:/Users/mahon/stmWork/New folder/common/FreeRTOS/portable/GCC/ARM_CM4F" -I"C:/Users/mahon/stmWork/New folder/common/SEGGER/config" -I"C:/Users/mahon/stmWork/New folder/common/SEGGER/os" -I"C:/Users/mahon/stmWork/New folder/common/SEGGER/SEGGER" -I../Drivers/CMSIS/Include -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Third_party-2f-FreeRTOS-2f-portable-2f-GCC-2f-ARM_CM4F

clean-Third_party-2f-FreeRTOS-2f-portable-2f-GCC-2f-ARM_CM4F:
	-$(RM) ./Third_party/FreeRTOS/portable/GCC/ARM_CM4F/port.d ./Third_party/FreeRTOS/portable/GCC/ARM_CM4F/port.o ./Third_party/FreeRTOS/portable/GCC/ARM_CM4F/port.su

.PHONY: clean-Third_party-2f-FreeRTOS-2f-portable-2f-GCC-2f-ARM_CM4F

