# declare project
PROJECT(DCMTK)

cmake_minimum_required(VERSION 2.6)
SET(DCMTK_PACKAGE_NAME "DCMTK")
SET(DCMTK_PACKAGE_VERSION_NUMBER "355")
SET(DCMTK_PACKAGE_VERSION_SUFFIX "")
SET(DCMTK_PACKAGE_DATE "20100226")
SET(DCMTK_DEFAULT_CONFIGURATION_DIR "")
SET(DCMTK_DEFAULT_SUPPORT_DATA_DIR "")

SET(DCMTK_MAJOR_VERSION 3)
SET(DCMTK_MINOR_VERSION 5)
SET(DCMTK_BUILD_VERSION 5)
SET(DCMTK_PACKAGE_VERSION "${DCMTK_MAJOR_VERSION}.${DCMTK_MINOR_VERSION}.${DCMTK_BUILD_VERSION}")
SET(DCMTK_API_VERSION "${DCMTK_MAJOR_VERSION}.${DCMTK_MINOR_VERSION}")
SET(DCMTK_LIBRARY_PROPERTIES VERSION "${DCMTK_PACKAGE_VERSION}" SOVERSION "${DCMTK_API_VERSION}")

SET(DCMTK_INSTALL_INCLUDE_DIR "include")
SET(DCMTK_INSTALL_LIB_DIR "lib")
SET(DCMTK_INSTALL_BIN_DIR "bin")

#-----------------------------------------------------------------------------
# Output directories.
IF(NOT LIBRARY_OUTPUT_PATH)
  SET (LIBRARY_OUTPUT_PATH ${DCMTK_BINARY_DIR}/bin CACHE INTERNAL "Single output directory for building all libraries.")
ENDIF(NOT LIBRARY_OUTPUT_PATH)
IF(NOT EXECUTABLE_OUTPUT_PATH)
  SET (EXECUTABLE_OUTPUT_PATH ${DCMTK_BINARY_DIR}/bin CACHE INTERNAL "Single output directory for building all executables.")
ENDIF(NOT EXECUTABLE_OUTPUT_PATH)
MARK_AS_ADVANCED(LIBRARY_OUTPUT_PATH EXECUTABLE_OUTPUT_PATH)

SET(ITK_LIBRARY_PATH "${LIBRARY_OUTPUT_PATH}")
SET(ITK_EXECUTABLE_PATH "${EXECUTABLE_OUTPUT_PATH}")
SET(CXX_TEST_PATH ${EXECUTABLE_OUTPUT_PATH})

# On Visual Studio 8 MS deprecated C. This removes all 1.276E1265 security
# warnings
IF(WIN32)
  IF(NOT BORLAND)
    IF(NOT CYGWIN)
      IF(NOT MINGW)
        IF(NOT DCMTK_ENABLE_VISUAL_STUDIO_DEPRECATED_C_WARNINGS)
          ADD_DEFINITIONS(
            -D_CRT_FAR_MAPPINGS_NO_DEPRECATE
            -D_CRT_IS_WCTYPE_NO_DEPRECATE
            -D_CRT_MANAGED_FP_NO_DEPRECATE
            -D_CRT_NONSTDC_NO_DEPRECATE
            -D_CRT_SECURE_NO_DEPRECATE
            -D_CRT_SECURE_NO_DEPRECATE_GLOBALS
            -D_CRT_SETERRORMODE_BEEP_SLEEP_NO_DEPRECATE
            -D_CRT_TIME_FUNCTIONS_NO_DEPRECATE
            -D_CRT_VCCLRIT_NO_DEPRECATE
            -D_SCL_SECURE_NO_DEPRECATE
            )
        ENDIF(NOT DCMTK_ENABLE_VISUAL_STUDIO_DEPRECATED_C_WARNINGS)
      ENDIF(NOT MINGW)
    ENDIF(NOT CYGWIN)
  ENDIF(NOT BORLAND)
ENDIF(WIN32)

# configure Dart testing support, but only if this isn't a subdirectory
IF(NOT DCMTK_IS_SUBPACKAGE)
  INCLUDE(${CMAKE_ROOT}/Modules/Dart.cmake)
  IF(BUILD_TESTING)
    ENABLE_TESTING()
  ENDIF(BUILD_TESTING)
ENDIF(NOT DCMTK_IS_SUBPACKAGE)

# a cmake file, similar to FindDCMTK.cmake, that can be used in vtkAtamaiIO.
INCLUDE(${DCMTK_SOURCE_DIR}/CMake/UseDCMTK.cmake)

# dcmtk build options
OPTION(BUILD_SHARED_LIBS "Build shared libraries." OFF)
OPTION(DCMTK_WITH_TIFF "Support for TIFF" OFF)
OPTION(DCMTK_WITH_PNG "Support for PNG" OFF)
OPTION(DCMTK_WITH_XML "Support for XML" OFF) # libxml2 is required
OPTION(DCMTK_WITH_ZLIB "Support for ZLIB" OFF) # zlib-1.2.3 is required
OPTION(DCMTK_WITH_OPENSSL "Support for OPENSSL" OFF) # openssl-0.9.8a is required
OPTION(DCMTK_WITH_PRIVATE_TAGS "Support for DICOM private tags" ON)
OPTION(DCMTK_BUILD_APPS "Build the dcmtk apps" OFF)
OPTION(DCMTK_WITH_THREADS "Support for multi-threading" ON)

# Find TIFF
IF(DCMTK_WITH_TIFF)
  FIND_PACKAGE(TIFF)
  INCLUDE_DIRECTORIES(${TIFF_INCLUDE_DIR})
  SET(LIBTIFF_LIBS ${TIFF_LIBRARY})
ENDIF(DCMTK_WITH_TIFF)

# Find PNG
IF(DCMTK_WITH_PNG)
  FIND_PACKAGE(PNG)
  INCLUDE_DIRECTORIES(${PNG_INCLUDE_DIR})
  SET(LIBPNG_LIBS ${PNG_LIBRARY})
ENDIF(DCMTK_WITH_PNG)

# Find xml2
#IF(DCMTK_WITH_XML)
#  FIND_PACKAGE(LibXml2)
#  INCLUDE_DIRECTORIES(${LIBXML2_INCLUDE_DIR})
#  SET(LIBXML2_LIBS ${LIBXML2_LIBRARY})
#ENDIF(DCMTK_WITH_XML)

#IF(DCMTK_WITH_ZLIB)
#  FIND_PACKAGE(ZLIB)
#  INCLUDE_DIRECTORIES(${LIBZLIB_INCLUDE_DIR})
#  SET(LIBZLIB_LIBS ${LIBZLIB_LIBRARY})
#ENDIF(DCMTK_WITH_ZLIB)

#IF(DCMTK_WITH_OPENSSL)
#  FIND_PACKAGE(OPENSSL)
#  INCLUDE_DIRECTORIES(${OPENSSL_INCLUDE_DIR})
#  SET(OPENSSL_LIBS ${OPENSSL_LIBRARY})
#ENDIF(DCMTK_WITH_OPENSSL)


# TODO:
# libxml2
# zlib-1.2.3
# openssl-0.9.8a

# settings for Apple
IF(APPLE)
  # Need to fix ofstd/libsrc/ofthread.cc
  MESSAGE(STATUS "APPLE - FORCE THREADS OFF") # semaphores must be named in OS X!
  SET(DCMTK_WITH_THREADS OFF CACHE BOOL "" FORCE)
ENDIF(APPLE)

# setting for IA64 / x86_64
IF(UNIX)
  IF(CMAKE_SYSTEM_PROCESSOR STREQUAL "ia64" OR CMAKE_SYSTEM_PROCESSOR STREQUAL  "x86_64")
    SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC")
    SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIC")
  ENDIF(CMAKE_SYSTEM_PROCESSOR STREQUAL "ia64" OR CMAKE_SYSTEM_PROCESSOR STREQUAL  "x86_64")
ENDIF(UNIX)

# settings for Borland C++
IF(CMAKE_CXX_COMPILER MATCHES bcc32)
  # further settings required?
  SET(CMAKE_STANDARD_LIBRARIES "import32.lib cw32mt.lib")
ENDIF(CMAKE_CXX_COMPILER MATCHES bcc32)

# add the osconfig.h.in file
INCLUDE(${DCMTK_SOURCE_DIR}/CMake/GenerateDCMTKConfigure.cmake)
CONFIGURE_FILE(${DCMTK_SOURCE_DIR}/osconfig.h.in
               ${DCMTK_BINARY_DIR}/include/dcmtk/config/osconfig.h)

# SET(cfplateform unix)
# IF(WIN32)
#   SET(cfplateform win32)
# ENDIF()
# SET(cfplateform_file ${DCMTK_BINARY_DIR}/include/dcmtk/config/cf${cfplateform}.h)
# CONFIGURE_FILE(${DCMTK_SOURCE_DIR}/config/include/dcmtk/config/cf${cfplateform}.h.in
#                ${cfplateform_file})

# find the system png include directory
FIND_PATH(SYSTEM_PNG_INCLUDE_DIR png.h
          /usr/local/include
          /usr/include
)

# expands the full path in the png.h
CONFIGURE_FILE(${DCMTK_SOURCE_DIR}/png.h.in
               ${DCMTK_BINARY_DIR}/include/png.h)

# see dcmtk-3.5.4/config/configure.in
IF(WITH_THREADS)
  ADD_DEFINITIONS(-D_REENTRANT)
  IF(HAVE_PTHREAD_RWLOCK)
    IF(APPLE)
      ADD_DEFINITIONS(-D_XOPEN_SOURCE_EXTENDED -D_BSD_SOURCE -D_BSD_COMPAT -D_OSF_SOURCE)
    ENDIF(APPLE)

    IF("${CMAKE_SYSTEM_NAME}" MATCHES "^IRIX")
      ADD_DEFINITIONS(-D_XOPEN_SOURCE_EXTENDED -D_BSD_SOURCE -D_BSD_COMPAT)
    ENDIF("${CMAKE_SYSTEM_NAME}" MATCHES "^IRIX")

  ENDIF(HAVE_PTHREAD_RWLOCK)
  IF(HAVE_PTHREAD_H)
     CHECK_LIBRARY_EXISTS(pthread pthread_key_create "" HAVE_LIBPTHREAD)
     IF(HAVE_LIBPTHREAD)
       SET(THREAD_LIBS pthread)
     ENDIF(HAVE_LIBPTHREAD)
     CHECK_LIBRARY_EXISTS(rt sem_init "" HAVE_LIBRT)
     IF(HAVE_LIBRT)
       SET(THREAD_LIBS ${THREAD_LIBS} rt)
     ENDIF(HAVE_LIBRT)
  ENDIF(HAVE_PTHREAD_H)
ENDIF(WITH_THREADS)

SET(DCMTK_LIBS
  ofstd
  oflog
  dcmdata
  dcmimgle
  dcmjpeg
  dcmimage
  dcmtls
  dcmnet
  dcmwlm
  dcmqrdb
  dcmsr
  dcmpstat
  dcmsign
  )
# recurse into subdirectories
FOREACH(lib ${DCMTK_LIBS})
  ADD_SUBDIRECTORY(${lib})
ENDFOREACH()


# Install global headers
INSTALL(FILES
  ${CMAKE_CURRENT_BINARY_DIR}/include/dcmtk/config/osconfig.h
  DESTINATION ${DCMTK_INSTALL_INCLUDE_DIR}/dcmtk/config COMPONENT Development
  )
# INSTALL(FILES
#   ${cfplateform_file}
#   DESTINATION ${DCMTK_INSTALL_INCLUDE_DIR}/dcmtk/config COMPONENT Development
#   )

# Install headers and static libraries
FOREACH(lib ${DCMTK_LIBS})
  FILE(GLOB headers_to_install "${CMAKE_CURRENT_SOURCE_DIR}/${lib}/include/dcmtk/${lib}/*.h")
  INSTALL(FILES
    ${headers_to_install}
    DESTINATION ${DCMTK_INSTALL_INCLUDE_DIR}/dcmtk/${lib} COMPONENT Development
    )
ENDFOREACH()

# Install rules specific to oflog
SET(lib oflog)
SET(lib_include_subdirs config helpers spi)
FOREACH(lib_include_subdir ${lib_include_subdirs})
  FILE(GLOB headers_to_install "${CMAKE_CURRENT_SOURCE_DIR}/${lib}/include/dcmtk/${lib}/${lib_include_subdir}/*.h")
  INSTALL(FILES
    ${headers_to_install}
    DESTINATION ${DCMTK_INSTALL_INCLUDE_DIR}/dcmtk/${lib}/${lib_include_subdir} COMPONENT Development
    )
ENDFOREACH()
