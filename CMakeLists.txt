cmake_minimum_required(VERSION 3.0)
project(grafton)

find_path(UUID_INCLUDE_DIR uuid/uuid.h)
find_library(UUID_LIBRARY NAMES uuid PATH)

find_library(CHECK_LIBRARY NAMES check PATH)
