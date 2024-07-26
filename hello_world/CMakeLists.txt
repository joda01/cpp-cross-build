cmake_minimum_required(VERSION 3.5)
project (imagec
         VERSION 1.0.0
         HOMEPAGE_URL https://danmayr.org
         LANGUAGES CXX C)

SET(CMAKE_CXX20_STANDARD 20)
SET(CMAKE_CXX20_STANDARD_REQUIRED true)
set(CMAKE_AUTOMOC ON)

# Find required libraries (adjust as needed)
find_package(OpenSSL REQUIRED)

# Define possible target systems
set(TARGET_SYSTEMS "WIN64-X86_64" "APPLE-M1" "APPLE-X86_64" "LINUX-X86_64")

# Get the target system from the command line
option(TARGET_SYSTEM "Target system")



if(TARGET_SYSTEM STREQUAL "Linux-X86_64")
  #
  # System: Linux
  # Target: x86_64
  #

elseif(TARGET_SYSTEM STREQUAL "Linux-arm64")
    #
    # System: Linux
    # Target: x86_64
    #
    SET(CMAKE_CXX_COMPILER /usr/aarch64-linux-gnu/bin/g++)
    SET(CMAKE_C_COMPILER /usr/aarch64-linux-gnu/bin/g++)
    SET(CMAKE_LINKER /usr/aarch64-linux-gnu/bin/ld)


    set(CMAKE_PROGRAM_PATH "/usr/aarch64-linux-gnu/bin" )
    set(CMAKE_LIBRARY_PATH "/usr/aarch64-linux-gnu/bin" )
    set(CMAKE_SYSTEM_PROGRAM_PATH "/usr/aarch64-linux-gnu/bin" )
    set(CMAKE_SYSTEM_PREFIX_PATH "/usr/aarch64-linux-gnu/bin")

    link_directories("/usr/aarch64-linux-gnu/lib")


elseif(TARGET_SYSTEM STREQUAL "Windows-X86_64")
    #
    # System: Windows
    # Target: x86_64
    #
    SET(CMAKE_CXX_COMPILER /usr/x86_64-w64-mingw32/bin/c++)
    SET(CMAKE_C_COMPILER /usr/x86_64-w64-mingw32/bin/c++)
    SET(CMAKE_LINKER /usr/x86_64-w64-mingw32/bin/ldd)


    set(CMAKE_PROGRAM_PATH "/usr/x86_64-w64-mingw32/bin" )
    set(CMAKE_LIBRARY_PATH "/usr/x86_64-w64-mingw32/bin" )
    set(CMAKE_SYSTEM_PROGRAM_PATH "/usr/x86_64-w64-mingw32/bin" )
    set(CMAKE_SYSTEM_PREFIX_PATH "/usr/x86_64-w64-mingw32/bin")

    link_directories("/usr/x86_64-w64-mingw32/lib")

elseif(TARGET_SYSTEM STREQUAL "Darwin-arm64")
    #
    # System: MacOs
    # Target: arm64/M1
    #

    SET(CMAKE_CXX_COMPILER /usr/osxcross/bin/arm64-apple-darwin23.6-c++)
    SET(CMAKE_C_COMPILER /usr/osxcross/bin/arm64-apple-darwin23.6-c++)
    SET(CMAKE_LINKER /usr/osxcross/bin/arm64-apple-darwin23.6-ld)


    set(CMAKE_PROGRAM_PATH "/usr/osxcross/bin" )
    set(CMAKE_LIBRARY_PATH "/usr/osxcross/bin" )
    set(CMAKE_SYSTEM_PROGRAM_PATH "/usr/osxcross/bin" )
    set(CMAKE_SYSTEM_PREFIX_PATH "/usr/osxcross/bin")


    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libc++ -fuse-ld=${CMAKE_LINKER}")


  elseif(TARGET_SYSTEM STREQUAL "Darwin-X86_64")
    #
    # System: MacOs
    # Target: x86_64
    #

    SET(CMAKE_CXX_COMPILER /usr/osxcross/bin/x86_64-apple-darwin23.6-c++)
    SET(CMAKE_C_COMPILER /usr/osxcross/bin/x86_64-apple-darwin23.6-c++)
    SET(CMAKE_LINKER /usr/osxcross/bin/x86_64-apple-darwin23.6-ld)


    set(CMAKE_PROGRAM_PATH "/usr/osxcross/bin" )
    set(CMAKE_LIBRARY_PATH "/usr/osxcross/bin" )
    set(CMAKE_SYSTEM_PROGRAM_PATH "/usr/osxcross/bin" )
    set(CMAKE_SYSTEM_PREFIX_PATH "/usr/osxcross/bin")


    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libc++ -fuse-ld=${CMAKE_LINKER}")
else()
    message(FATAL_ERROR "Invalid target system: ${TARGET_SYSTEM}")
endif()

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3 -std=c++20")


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
