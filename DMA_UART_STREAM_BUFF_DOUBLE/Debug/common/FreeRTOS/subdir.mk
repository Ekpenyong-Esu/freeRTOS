################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../common/FreeRTOS/croutine.c \
../common/FreeRTOS/event_groups.c \
../common/FreeRTOS/list.c \
../common/FreeRTOS/queue.c \
../common/FreeRTOS/stream_buffer.c \
../common/FreeRTOS/tasks.c \
../common/FreeRTOS/timers.c 

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
common/FreeRTOS/%.o common/FreeRTOS/%.su common/FreeRTOS/%.cyclo: ../common/FreeRTOS/%.c common/FreeRTOS/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F429xx -DUSE_FULL_ASSERT=1 -c -I"C:/Users/mahon/stmWork/freeRTOS/DMA_UART_STREAM_BUFF_DOUBLE/common/FreeRTOS/include" -I"C:/Users/mahon/stmWork/freeRTOS/DMA_UART_STREAM_BUFF_DOUBLE/common/FreeRTOS/portable/GCC/ARM_CM4F" -I"C:/Users/mahon/stmWork/freeRTOS/DMA_UART_STREAM_BUFF_DOUBLE/common/SEGGER/config" -I"C:/Users/mahon/stmWork/freeRTOS/DMA_UART_STREAM_BUFF_DOUBLE/common/SEGGER/os" -I"C:/Users/mahon/stmWork/freeRTOS/DMA_UART_STREAM_BUFF_DOUBLE/common/SEGGER/SEGGER" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-common-2f-FreeRTOS

clean-common-2f-FreeRTOS:
	-$(RM) ./common/FreeRTOS/croutine.cyclo ./common/FreeRTOS/croutine.d ./common/FreeRTOS/croutine.o ./common/FreeRTOS/croutine.su ./common/FreeRTOS/event_groups.cyclo ./common/FreeRTOS/event_groups.d ./common/FreeRTOS/event_groups.o ./common/FreeRTOS/event_groups.su ./common/FreeRTOS/list.cyclo ./common/FreeRTOS/list.d ./common/FreeRTOS/list.o ./common/FreeRTOS/list.su ./common/FreeRTOS/queue.cyclo ./common/FreeRTOS/queue.d ./common/FreeRTOS/queue.o ./common/FreeRTOS/queue.su ./common/FreeRTOS/stream_buffer.cyclo ./common/FreeRTOS/stream_buffer.d ./common/FreeRTOS/stream_buffer.o ./common/FreeRTOS/stream_buffer.su ./common/FreeRTOS/tasks.cyclo ./common/FreeRTOS/tasks.d ./common/FreeRTOS/tasks.o ./common/FreeRTOS/tasks.su ./common/FreeRTOS/timers.cyclo ./common/FreeRTOS/timers.d ./common/FreeRTOS/timers.o ./common/FreeRTOS/timers.su

.PHONY: clean-common-2f-FreeRTOS

