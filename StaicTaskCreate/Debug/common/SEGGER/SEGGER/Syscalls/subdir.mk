################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/mahon/stmWork/common/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_GCC.c 

OBJS += \
./common/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_GCC.o 

C_DEPS += \
./common/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_GCC.d 


# Each subdirectory must supply rules for building sources it contributes
common/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_GCC.o: C:/Users/mahon/stmWork/common/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_GCC.c common/SEGGER/SEGGER/Syscalls/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F429xx -c -I../Core/Inc -I"C:/Users/mahon/stmWork/common/FreeRTOS/include" -I"C:/Users/mahon/stmWork/common/FreeRTOS/portable/GCC/ARM_CM4F" -I"C:/Users/mahon/stmWork/common/FreeRTOS/portable/GCC/ARM_CM4F" -I"C:/Users/mahon/stmWork/common/SEGGER/config" -I"C:/Users/mahon/stmWork/common/SEGGER/os" -I"C:/Users/mahon/stmWork/common/SEGGER/SEGGER" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-common-2f-SEGGER-2f-SEGGER-2f-Syscalls

clean-common-2f-SEGGER-2f-SEGGER-2f-Syscalls:
	-$(RM) ./common/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_GCC.d ./common/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_GCC.o ./common/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_GCC.su

.PHONY: clean-common-2f-SEGGER-2f-SEGGER-2f-Syscalls

