################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/mahon/stmWork/freeRTOS/common/SEGGER/SEGGER/SEGGER_RTT.c \
C:/Users/mahon/stmWork/freeRTOS/common/SEGGER/SEGGER/SEGGER_RTT_printf.c \
C:/Users/mahon/stmWork/freeRTOS/common/SEGGER/SEGGER/SEGGER_SYSVIEW.c 

S_UPPER_SRCS += \
C:/Users/mahon/stmWork/freeRTOS/common/SEGGER/SEGGER/SEGGER_RTT_ASM_ARMv7M.S 

OBJS += \
./common/SEGGER/SEGGER/SEGGER_RTT.o \
./common/SEGGER/SEGGER/SEGGER_RTT_ASM_ARMv7M.o \
./common/SEGGER/SEGGER/SEGGER_RTT_printf.o \
./common/SEGGER/SEGGER/SEGGER_SYSVIEW.o 

S_UPPER_DEPS += \
./common/SEGGER/SEGGER/SEGGER_RTT_ASM_ARMv7M.d 

C_DEPS += \
./common/SEGGER/SEGGER/SEGGER_RTT.d \
./common/SEGGER/SEGGER/SEGGER_RTT_printf.d \
./common/SEGGER/SEGGER/SEGGER_SYSVIEW.d 


# Each subdirectory must supply rules for building sources it contributes
common/SEGGER/SEGGER/SEGGER_RTT.o: C:/Users/mahon/stmWork/freeRTOS/common/SEGGER/SEGGER/SEGGER_RTT.c common/SEGGER/SEGGER/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_FULL_ASSERT=1 -DUSE_HAL_DRIVER -DSTM32F429xx -c -I"C:/Users/mahon/stmWork/freeRTOS/common/FreeRTOS/include" -I"C:/Users/mahon/stmWork/freeRTOS/common/FreeRTOS/portable/GCC/ARM_CM4F" -I"C:/Users/mahon/stmWork/freeRTOS/common/SEGGER/config" -I"C:/Users/mahon/stmWork/freeRTOS/common/SEGGER/os" -I"C:/Users/mahon/stmWork/freeRTOS/common/SEGGER/SEGGER" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
common/SEGGER/SEGGER/SEGGER_RTT_ASM_ARMv7M.o: C:/Users/mahon/stmWork/freeRTOS/common/SEGGER/SEGGER/SEGGER_RTT_ASM_ARMv7M.S common/SEGGER/SEGGER/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
common/SEGGER/SEGGER/SEGGER_RTT_printf.o: C:/Users/mahon/stmWork/freeRTOS/common/SEGGER/SEGGER/SEGGER_RTT_printf.c common/SEGGER/SEGGER/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_FULL_ASSERT=1 -DUSE_HAL_DRIVER -DSTM32F429xx -c -I"C:/Users/mahon/stmWork/freeRTOS/common/FreeRTOS/include" -I"C:/Users/mahon/stmWork/freeRTOS/common/FreeRTOS/portable/GCC/ARM_CM4F" -I"C:/Users/mahon/stmWork/freeRTOS/common/SEGGER/config" -I"C:/Users/mahon/stmWork/freeRTOS/common/SEGGER/os" -I"C:/Users/mahon/stmWork/freeRTOS/common/SEGGER/SEGGER" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
common/SEGGER/SEGGER/SEGGER_SYSVIEW.o: C:/Users/mahon/stmWork/freeRTOS/common/SEGGER/SEGGER/SEGGER_SYSVIEW.c common/SEGGER/SEGGER/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_FULL_ASSERT=1 -DUSE_HAL_DRIVER -DSTM32F429xx -c -I"C:/Users/mahon/stmWork/freeRTOS/common/FreeRTOS/include" -I"C:/Users/mahon/stmWork/freeRTOS/common/FreeRTOS/portable/GCC/ARM_CM4F" -I"C:/Users/mahon/stmWork/freeRTOS/common/SEGGER/config" -I"C:/Users/mahon/stmWork/freeRTOS/common/SEGGER/os" -I"C:/Users/mahon/stmWork/freeRTOS/common/SEGGER/SEGGER" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-common-2f-SEGGER-2f-SEGGER

clean-common-2f-SEGGER-2f-SEGGER:
	-$(RM) ./common/SEGGER/SEGGER/SEGGER_RTT.cyclo ./common/SEGGER/SEGGER/SEGGER_RTT.d ./common/SEGGER/SEGGER/SEGGER_RTT.o ./common/SEGGER/SEGGER/SEGGER_RTT.su ./common/SEGGER/SEGGER/SEGGER_RTT_ASM_ARMv7M.d ./common/SEGGER/SEGGER/SEGGER_RTT_ASM_ARMv7M.o ./common/SEGGER/SEGGER/SEGGER_RTT_printf.cyclo ./common/SEGGER/SEGGER/SEGGER_RTT_printf.d ./common/SEGGER/SEGGER/SEGGER_RTT_printf.o ./common/SEGGER/SEGGER/SEGGER_RTT_printf.su ./common/SEGGER/SEGGER/SEGGER_SYSVIEW.cyclo ./common/SEGGER/SEGGER/SEGGER_SYSVIEW.d ./common/SEGGER/SEGGER/SEGGER_SYSVIEW.o ./common/SEGGER/SEGGER/SEGGER_SYSVIEW.su

.PHONY: clean-common-2f-SEGGER-2f-SEGGER

