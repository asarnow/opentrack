SET(CMAKE_SYSTEM_NAME Windows)
SET(CMAKE_SYSTEM_VERSION 1)

SET(MSYS 1)

SET(BUILD_SHARED_LIBS ON)
SET(LIBTYPE SHARED)

SET(CMAKE_C_COMPILER i686-w64-mingw32.shared-gcc)
SET(CMAKE_CXX_COMPILER i686-w64-mingw32.shared-g++)
SET(CMAKE_RC_COMPILER i686-w64-mingw32.shared-windres)

SET(CMAKE_FIND_ROOT_PATH /opt/mxe/usr/i686-w64-mingw32.shared)

SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# don't poison with system compile-time data
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

SET(CMAKE_MODULE_PATH "/opt/mxe/src/cmake" ${CMAKE_MODULE_PATH}) # For mxe FindPackage scripts
SET(CMAKE_INSTALL_PREFIX /opt/mxe/usr/i686-w64-mingw32.shared CACHE PATH "Installation Prefix")

SET(CMAKE_CROSS_COMPILING ON) # Workaround for http://www.cmake.org/Bug/view.php?id=14075
SET(CMAKE_RC_COMPILE_OBJECT "<CMAKE_RC_COMPILER> -O coff <FLAGS> <DEFINES> -o <OBJECT> <SOURCE>") # Workaround for buggy windres rules
SET(PKG_CONFIG_EXECUTABLE /opt/mxe/usr/bin/i686-w64-mingw32.shared-pkg-config)

set(CMAKE_C_FLAGS_RELEASE "-O3 -ffast-math -flto -fno-use-linker-plugin -march=i686 -mtune=prescott -msse -msse2 -mno-sse3 -mno-avx -frename-registers" CACHE STRING "" FORCE)
set(CMAKE_SHARED_LINKER_FLAGS_RELEASE "-msse -msse2 -mno-sse3 -mno-avx -fno-use-linker-plugin -flto" CACHE STRING "" FORCE)
set(CMAKE_EXE_LINKER_FLAGS_RELEASE ${CMAKE_SHARED_LINKER_FLAGS_RELEASE})
set(CMAKE_CXX_FLAGS_RELEASE ${CMAKE_C_FLAGS_RELEASE} CACHE STRING "" FORCE)
#SET(CMAKE_BUILD_TYPE Release CACHE STRING "Debug|Release|RelWithDebInfo|MinSizeRel")
set(CMAKE_BUILD_TYPE "RELEASE" CACHE STRING "" FORCE)
