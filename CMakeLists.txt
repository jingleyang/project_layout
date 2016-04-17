# CMakeLists files in this project

cmake_minimum_required(VERSION 2.8)
project(test)
add_subdirectory(src)
add_executable(test src/main.cpp)
install(TARGETS test DESTINATION bin)

