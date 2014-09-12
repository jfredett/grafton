cmake_minimum_required(VERSION 3.0)
project(grafton)

find_path(UUID_INCLUDE_DIR uuid/uuid.h)
find_library(UUID_LIBRARY NAMES uuid PATH)

find_library(CHECK_LIBRARY NAMES check PATH)

set(PROJECT_BINARY_DIR ./bin)
set(PROJECT_SOURCE_DIR ./src)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY bin)

set(CMAKE_C_FLAGS "-g -Wall")

# extend this if we ever go deeper than 2 layers of subdirs
file(GLOB grafton_SOURCES
  src/*.c
  src/**/*.c
  src/**/**/*.c)

include_directories(src)

link_directories(lib)

# add the command to generate the source code
#add_custom_command (
  #OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/Table.h
  #COMMAND MakeTable ${CMAKE_CURRENT_BINARY_DIR}/Table.h
  #DEPENDS MakeTable
  #)

add_executable(grafton ${grafton_SOURCES})
add_library(graftondb ${grafton_SOURCES})
