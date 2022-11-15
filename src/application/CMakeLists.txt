set(MODULE_NAME application)

add_executable(${MODULE_NAME}
    main.cpp
)

target_link_libraries(${MODULE_NAME}
    -Wl,-start-group
    -Wl,--whole-archive
    stm32cubef4
    -Wl,--no-whole-archive
    cpu
    -lg
    -Wl,-end-group
    -static
    -Wl,-Map=${MODULE_NAME}.map
)

add_custom_command(TARGET ${MODULE_NAME} POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O ihex $<TARGET_FILE:${MODULE_NAME}> ${MODULE_NAME}.hex
    COMMAND ${CMAKE_OBJCOPY} -O binary $<TARGET_FILE:${MODULE_NAME}> ${MODULE_NAME}.bin

    # Print sizes
    COMMAND ${CMAKE_SIZE} --format sysv -x $<TARGET_FILE:${MODULE_NAME}>
)
