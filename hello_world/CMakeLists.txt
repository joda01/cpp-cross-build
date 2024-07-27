cmake_minimum_required(VERSION 3.5)
project (imagec
         VERSION 1.0.0
         HOMEPAGE_URL https://danmayr.org
         LANGUAGES CXX C)

SET(CMAKE_CXX20_STANDARD 20)
SET(CMAKE_CXX20_STANDARD_REQUIRED true)
set(CMAKE_AUTOMOC ON)


SET(CMAKE_GENERATOR "Unix Makefiles")
SET(CMAKE_EXPORT_COMPILE_COMMANDS true)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})

# Add your source files

#set(RESOURCE_FILES
#    resources/resource.qrc
#)
#
#qt_add_resources(RESOURCE_SOURCES ${RESOURCE_FILES})

file(GLOB_RECURSE SOURCES
  ./src/*.cpp
  ./src/*.c
  ./src/*.cc
  /usr/local/include/libtiff/*.h
# ${RESOURCE_SOURCES}
)
list(FILTER SOURCES EXCLUDE REGEX ".*_test.cpp$")
add_executable(${PROJECT_NAME} ${SOURCES})


target_link_libraries(${PROJECT_NAME} ${TARGET_LINK_LIBRARIES})
