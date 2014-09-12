cmake_minimum_required(VERSION 2.8)
project(grafton)


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

# test stuff

#file(GLOB check_grafton_SOURCES
  #test/*.c
  #test/**/*.c
  #test/**/**/*.c)
#include_directories(test)

#add_executable(check_grafton ${grafton_SOURCES} ${check_grafton_SOURCES})
add_executable(grafton ${grafton_SOURCES})
add_library(graftondb ${grafton_SOURCES})

#find_library(check check_LIB)
#target_link_libraries(check_grafton ${check_LIB})

find_library(uuid uuid_LIB)
target_link_libraries(grafton ${uuid_LIB})
target_link_libraries(graftondb ${uuid_LIB})

# add the command to generate the source code
#add_custom_command (
  #OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/Table.h
  #COMMAND MakeTable ${CMAKE_CURRENT_BINARY_DIR}/Table.h
  #DEPENDS MakeTable
  #)

