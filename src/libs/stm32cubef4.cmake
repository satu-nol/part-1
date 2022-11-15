
set(STM32CUBEF4_INCLUDE_DIRS
    ${LIBS_PATH}/STM32CubeF4/Drivers/CMSIS/Include
    ${LIBS_PATH}/STM32CubeF4/Drivers/CMSIS/Device/ST/STM32F4xx/Include
)

set(STM32CUBEF4_SOURCE_FILES
    ${LIBS_PATH}/STM32CubeF4/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f401xc.s
    ${LIBS_PATH}/STM32CubeF4/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/system_stm32f4xx.c
)

set(STM32CUBEF4_INCLUDE_DIRS ${STM32CUBEF4_INCLUDE_DIRS}
    ${LIBS_PATH}/custom
    ${LIBS_PATH}/STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Inc
)

set(STM32CUBEF4_SOURCE_FILES ${STM32CUBEF4_SOURCE_FILES}
    ${LIBS_PATH}/STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal.c
    ${LIBS_PATH}/STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cortex.c
    ${LIBS_PATH}/STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma.c
    ${LIBS_PATH}/STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash.c
    ${LIBS_PATH}/STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ramfunc.c
    ${LIBS_PATH}/STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ex.c
    ${LIBS_PATH}/STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc.c
    ${LIBS_PATH}/STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc_ex.c
    ${LIBS_PATH}/STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.c
    ${LIBS_PATH}/STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr_ex.c
    ${LIBS_PATH}/STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_uart.c
)

add_library(stm32cubef4 STATIC ${STM32CUBEF4_SOURCE_FILES})
target_include_directories(stm32cubef4 PUBLIC ${STM32CUBEF4_INCLUDE_DIRS})

set(STM32CUBEF4_CORE_FLAGS
    -mcpu=cortex-m4
    -mfpu=fpv4-sp-d16
    -mfloat-abi=hard
)

string(REPLACE ";" " " STM32CUBEF4_FLAGS "${STM32CUBEF4_CORE_FLAGS}")
set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} ${STM32CUBEF4_FLAGS}" CACHE STRING "" FORCE)
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG}  ${STM32CUBEF4_FLAGS}" CACHE STRING "" FORCE)
set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} ${STM32CUBEF4_FLAGS}" CACHE STRING "" FORCE)
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE}  ${STM32CUBEF4_FLAGS}" CACHE STRING "" FORCE)

target_link_libraries(stm32cubef4
    -Wl,--no-wchar-size-warning
    -Wl,--gc-sections
    -Wl,-n
    -T ${LIBS_PATH}/custom/STM32F401CCU6.ld
)

target_compile_definitions(stm32cubef4 PUBLIC "STM32F401xC")
