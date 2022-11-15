set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_VERSION 1)

SET(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
set(CMAKE_ASM_COMPILER "arm-none-eabi-gcc${TOOL_EXECUTABLE_SUFFIX}" CACHE INTERNAL "GNU ARM ASM compiler")
set(CMAKE_C_COMPILER "arm-none-eabi-gcc${TOOL_EXECUTABLE_SUFFIX}" CACHE INTERNAL "GNU ARM C compiler")
set(CMAKE_CXX_COMPILER "arm-none-eabi-g++${TOOL_EXECUTABLE_SUFFIX}" CACHE INTERNAL "GNU ARM C++ compiler")
set(CMAKE_OBJCOPY "arm-none-eabi-objcopy${TOOL_EXECUTABLE_SUFFIX}" CACHE INTERNAL "GNU ARM objcopy tool")
set(CMAKE_SIZE "arm-none-eabi-size${TOOL_EXECUTABLE_SUFFIX}" CACHE INTERNAL "GNU ARM size tool")
set(CMAKE_AR "arm-none-eabi-gcc-ar${TOOL_EXECUTABLE_SUFFIX}" CACHE INTERNAL "GNU ARM ar tool")
set(CMAKE_RANLIB "arm-none-eabi-gcc-ranlib${TOOL_EXECUTABLE_SUFFIX}" CACHE INTERNAL "GNU ARM ranlib")
set(CMAKE_OBJDUMP "arm-none-eabi-objdump${TOOL_EXECUTABLE_SUFFIX}" CACHE INTERNAL "GNU ARM objdump tool")


set(COMMON_FLAGS
    -Wall
    -Wextra
    -Werror
    -Wshadow
    -Wdouble-promotion
    -Wno-attributes
    -mthumb
    -Wno-unused-parameter
    -Wno-int-in-bool-context
    -Wno-shift-negative-value
    -Wno-psabi
    -Wformat=2
    -Wformat-truncation=2
    -MMD
    -fno-exceptions
    -fno-common
    -fno-builtin
    -ffreestanding
    -fno-delete-null-pointer-checks
    -fno-strict-aliasing
    -ffunction-sections
    -fdata-sections
    -funsigned-char
    -fomit-frame-pointer
    -fmessage-length=0
    -fstack-usage
)

set(COMMON_C_FLAGS
    ${COMMON_FLAGS}
    -std=gnu17
)

set(COMMON_CXX_FLAGS
    ${COMMON_FLAGS}
    -std=c++17
    -Wno-register
    -fno-rtti
    -fno-sized-deallocation
)

string(REPLACE ";" " " CMAKE_COMMON_C_FLAGS "${COMMON_C_FLAGS}")
string(REPLACE ";" " " CMAKE_COMMON_CXX_FLAGS "${COMMON_CXX_FLAGS}")

set(CMAKE_C_FLAGS_DEBUG "-g3 -Og --specs=nano.specs -u _printf_float --specs=nosys.specs ${CMAKE_COMMON_C_FLAGS}" CACHE INTERNAL "c compiler flags debug" FORCE)
set(CMAKE_CXX_FLAGS_DEBUG "-g3 -Og --specs=nano.specs -u _printf_float --specs=nosys.specs ${CMAKE_COMMON_CXX_FLAGS}" CACHE INTERNAL "cxx compiler flags debug" FORCE)
set(CMAKE_ASM_FLAGS_DEBUG "" CACHE INTERNAL "asm compiler flags debug" FORCE)
set(CMAKE_EXE_LINKER_FLAGS_DEBUG "" CACHE INTERNAL "linker flags debug" FORCE)

set(CMAKE_C_FLAGS_RELEASE "-g3 -Os --specs=nano.specs -u _printf_float --specs=nosys.specs ${CMAKE_COMMON_C_FLAGS}" CACHE INTERNAL "c compiler flags release" FORCE)
set(CMAKE_CXX_FLAGS_RELEASE "-g3 -Os --specs=nano.specs -u _printf_float --specs=nosys.specs ${CMAKE_COMMON_CXX_FLAGS}" CACHE INTERNAL "cxx compiler flags release" FORCE)
set(CMAKE_ASM_FLAGS_RELEASE "" CACHE INTERNAL "asm compiler flags release" FORCE)
set(CMAKE_EXE_LINKER_FLAGS_RELEASE "" CACHE INTERNAL "linker flags release" FORCE)
