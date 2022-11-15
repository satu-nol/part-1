cmake_minimum_required(VERSION 3.20)
project(part1 C CXX ASM)

include(${PROJECT_SOURCE_DIR}/cmake/utility.cmake)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_subdirectory(src)
