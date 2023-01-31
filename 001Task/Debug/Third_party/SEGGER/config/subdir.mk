################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Third_party/SEGGER/config/SEGGER_SYSVIEW_Config_FreeRTOS.c 

OBJS += \
./Third_party/SEGGER/config/SEGGER_SYSVIEW_Config_FreeRTOS.o 

C_DEPS += \
./Third_party/SEGGER/config/SEGGER_SYSVIEW_Config_FreeRTOS.d 


# Each subdirectory must supply rules for building sources it contributes
Third_party/SEGGER/config/%.o Third_party/SEGGER/config/%.su: ../Third_party/SEGGER/config/%.c Third_party/SEGGER/config/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F429xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/mahon/stmWork/001Task/Third_party/FreeRTOS/include" -I"C:/Users/mahon/stmWork/001Task/Third_party/FreeRTOS/portable/GCC/ARM_CM4F" -I"C:/Users/mahon/stmWork/001Task/Third_party/SEGGER/config" -I"C:/Users/mahon/stmWork/001Task/Third_party/SEGGER/os" -I"C:/Users/mahon/stmWork/001Task/Third_party/SEGGER/SEGGER" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Third_party-2f-SEGGER-2f-config

clean-Third_party-2f-SEGGER-2f-config:
	-$(RM) ./Third_party/SEGGER/config/SEGGER_SYSVIEW_Config_FreeRTOS.d ./Third_party/SEGGER/config/SEGGER_SYSVIEW_Config_FreeRTOS.o ./Third_party/SEGGER/config/SEGGER_SYSVIEW_Config_FreeRTOS.su

.PHONY: clean-Third_party-2f-SEGGER-2f-config

