
set(MODULE_NAME cpu)

add_library(${MODULE_NAME}
    src/cpu.cpp
)

target_include_directories(${MODULE_NAME}
    PUBLIC include
)

target_link_libraries(${MODULE_NAME} 
    stm32cubef4
)
