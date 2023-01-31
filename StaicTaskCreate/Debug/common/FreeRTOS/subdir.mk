################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/mahon/stmWork/common/FreeRTOS/croutine.c \
C:/Users/mahon/stmWork/common/FreeRTOS/event_groups.c \
C:/Users/mahon/stmWork/common/FreeRTOS/list.c \
C:/Users/mahon/stmWork/common/FreeRTOS/queue.c \
C:/Users/mahon/stmWork/common/FreeRTOS/stream_buffer.c \
C:/Users/mahon/stmWork/common/FreeRTOS/tasks.c \
C:/Users/mahon/stmWork/common/FreeRTOS/timers.c 

OBJS += \
./common/FreeRTOS/croutine.o \
./common/FreeRTOS/event_groups.o \
./common/FreeRTOS/list.o \
./common/FreeRTOS/queue.o \
./common/FreeRTOS/stream_buffer.o \
./common/FreeRTOS/tasks.o \
./common/FreeRTOS/timers.o 

C_DEPS += \
./common/FreeRTOS/croutine.d \
./common/FreeRTOS/event_groups.d \
./common/FreeRTOS/list.d \
./common/FreeRTOS/queue.d \
./common/FreeRTOS/stream_buffer.d \
./common/FreeRTOS/tasks.d \
./common/FreeRTOS/timers.d 


# Each subdirectory must supply rules for building sources it contributes
common/FreeRTOS/croutine.o: C:/Users/mahon/stmWork/common/FreeRTOS/croutine.c common/FreeRTOS/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F429xx -c -I../Core/Inc -I"C:/Users/mahon/stmWork/common/FreeRTOS/include" -I"C:/Users/mahon/stmWork/common/FreeRTOS/portable/GCC/ARM_CM4F" -I"C:/Users/mahon/stmWork/common/FreeRTOS/portable/GCC/ARM_CM4F" -I"C:/Users/mahon/stmWork/common/SEGGER/config" -I"C:/Users/mahon/stmWork/common/SEGGER/os" -I"C:/Users/mahon/stmWork/common/SEGGER/SEGGER" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
common/FreeRTOS/event_groups.o: C:/Users/mahon/stmWork/common/FreeRTOS/event_groups.c common/FreeRTOS/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F429xx -c -I../Core/Inc -I"C:/Users/mahon/stmWork/common/FreeRTOS/include" -I"C:/Users/mahon/stmWork/common/FreeRTOS/portable/GCC/ARM_CM4F" -I"C:/Users/mahon/stmWork/common/FreeRTOS/portable/GCC/ARM_CM4F" -I"C:/Users/mahon/stmWork/common/SEGGER/config" -I"C:/Users/mahon/stmWork/common/SEGGER/os" -I"C:/Users/mahon/stmWork/common/SEGGER/SEGGER" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
common/FreeRTOS/list.o: C:/Users/mahon/stmWork/common/FreeRTOS/list.c common/FreeRTOS/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F429xx -c -I../Core/Inc -I"C:/Users/mahon/stmWork/common/FreeRTOS/include" -I"C:/Users/mahon/stmWork/common/FreeRTOS/portable/GCC/ARM_CM4F" -I"C:/Users/mahon/stmWork/common/FreeRTOS/portable/GCC/ARM_CM4F" -I"C:/Users/mahon/stmWork/common/SEGGER/config" -I"C:/Users/mahon/stmWork/common/SEGGER/os" -I"C:/Users/mahon/stmWork/common/SEGGER/SEGGER" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
common/FreeRTOS/queue.o: C:/Users/mahon/stmWork/common/FreeRTOS/queue.c common/FreeRTOS/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F429xx -c -I../Core/Inc -I"C:/Users/mahon/stmWork/common/FreeRTOS/include" -I"C:/Users/mahon/stmWork/common/FreeRTOS/portable/GCC/ARM_CM4F" -I"C:/Users/mahon/stmWork/common/FreeRTOS/portable/GCC/ARM_CM4F" -I"C:/Users/mahon/stmWork/common/SEGGER/config" -I"C:/Users/mahon/stmWork/common/SEGGER/os" -I"C:/Users/mahon/stmWork/common/SEGGER/SEGGER" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
common/FreeRTOS/stream_buffer.o: C:/Users/mahon/stmWork/common/FreeRTOS/stream_buffer.c common/FreeRTOS/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F429xx -c -I../Core/Inc -I"C:/Users/mahon/stmWork/common/FreeRTOS/include" -I"C:/Users/mahon/stmWork/common/FreeRTOS/portable/GCC/ARM_CM4F" -I"C:/Users/mahon/stmWork/common/FreeRTOS/portable/GCC/ARM_CM4F" -I"C:/Users/mahon/stmWork/common/SEGGER/config" -I"C:/Users/mahon/stmWork/common/SEGGER/os" -I"C:/Users/mahon/stmWork/common/SEGGER/SEGGER" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
common/FreeRTOS/tasks.o: C:/Users/mahon/stmWork/common/FreeRTOS/tasks.c common/FreeRTOS/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F429xx -c -I../Core/Inc -I"C:/Users/mahon/stmWork/common/FreeRTOS/include" -I"C:/Users/mahon/stmWork/common/FreeRTOS/portable/GCC/ARM_CM4F" -I"C:/Users/mahon/stmWork/common/FreeRTOS/portable/GCC/ARM_CM4F" -I"C:/Users/mahon/stmWork/common/SEGGER/config" -I"C:/Users/mahon/stmWork/common/SEGGER/os" -I"C:/Users/mahon/stmWork/common/SEGGER/SEGGER" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
common/FreeRTOS/timers.o: C:/Users/mahon/stmWork/common/FreeRTOS/timers.c common/FreeRTOS/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F429xx -c -I../Core/Inc -I"C:/Users/mahon/stmWork/common/FreeRTOS/include" -I"C:/Users/mahon/stmWork/common/FreeRTOS/portable/GCC/ARM_CM4F" -I"C:/Users/mahon/stmWork/common/FreeRTOS/portable/GCC/ARM_CM4F" -I"C:/Users/mahon/stmWork/common/SEGGER/config" -I"C:/Users/mahon/stmWork/common/SEGGER/os" -I"C:/Users/mahon/stmWork/common/SEGGER/SEGGER" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-common-2f-FreeRTOS

clean-common-2f-FreeRTOS:
	-$(RM) ./common/FreeRTOS/croutine.d ./common/FreeRTOS/croutine.o ./common/FreeRTOS/croutine.su ./common/FreeRTOS/event_groups.d ./common/FreeRTOS/event_groups.o ./common/FreeRTOS/event_groups.su ./common/FreeRTOS/list.d ./common/FreeRTOS/list.o ./common/FreeRTOS/list.su ./common/FreeRTOS/queue.d ./common/FreeRTOS/queue.o ./common/FreeRTOS/queue.su ./common/FreeRTOS/stream_buffer.d ./common/FreeRTOS/stream_buffer.o ./common/FreeRTOS/stream_buffer.su ./common/FreeRTOS/tasks.d ./common/FreeRTOS/tasks.o ./common/FreeRTOS/tasks.su ./common/FreeRTOS/timers.d ./common/FreeRTOS/timers.o ./common/FreeRTOS/timers.su

.PHONY: clean-common-2f-FreeRTOS

