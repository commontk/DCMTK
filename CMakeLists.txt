# Declare project
PROJECT(DCMTK)

# Minimum CMake version required
CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

# Check the build system
INCLUDE(CMake/dcmtkPrepare.cmake NO_POLICY_SCOPE)

#-----------------------------------------------------------------------------
# General project settings to configure DCMTK build process
#-----------------------------------------------------------------------------

# Modules to be built
SET(DCMTK_MODULES ofstd oflog dcmdata dcmimgle
  dcmimage dcmjpeg dcmjpls dcmtls dcmnet dcmsr
  dcmsign dcmwlm dcmqrdb dcmpstat dcmrt)

#-----------------------------------------------------------------------------
# Include directories
#-----------------------------------------------------------------------------
SET(DCMTK_INCLUDE_DIR ${DCMTK_BINARY_DIR}/config/include)
FOREACH(inc ${DCMTK_MODULES})
  LIST(APPEND DCMTK_INCLUDE_DIR ${DCMTK_SOURCE_DIR}/${inc}/include)
ENDFOREACH(inc)

INCLUDE_DIRECTORIES(${DCMTK_INCLUDE_DIR})

#-----------------------------------------------------------------------------
# Prepare osconfig.h
#-----------------------------------------------------------------------------

CONFIGURE_FILE(${DCMTK_SOURCE_DIR}/CMake/osconfig.h.in
  ${DCMTK_BINARY_DIR}/config/include/dcmtk/config/osconfig.h)

#-----------------------------------------------------------------------------
# Start actual compilation tasks
#-----------------------------------------------------------------------------

# Recurse into subdirectories
FOREACH(module config doxygen ${DCMTK_MODULES})
  ADD_SUBDIRECTORY(${module})
ENDFOREACH(module)
INCLUDE(CMake/dcmtkAfterModules.cmake NO_POLICY_SCOPE)

#-----------------------------------------------------------------------------
# Installation tasks
#-----------------------------------------------------------------------------

# Install global headers
INSTALL(FILES ${DCMTK_BINARY_DIR}/config/include/dcmtk/config/osconfig.h
        DESTINATION ${DCMTK_INSTALL_INCDIR}/dcmtk/config
        COMPONENT include)

# Install DCMTK's general documentation files
INSTALL(FILES ANNOUNCE.${DCMTK_PACKAGE_VERSION_NUMBER} CHANGES.${DCMTK_PACKAGE_VERSION_NUMBER} COPYRIGHT FAQ HISTORY VERSION
        DESTINATION ${DCMTK_INSTALL_DOCDIR}
        COMPONENT doc)


#-----------------------------------------------------------------------------
# DCMTKConfig generation tasks
#-----------------------------------------------------------------------------

IF(HAVE_CONFIGURE_PACKAGE_CONFIG_FILE AND HAVE_WRITE_BASIC_PACKAGE_VERSION_FILE)

# Configure 'DCMTKTargets.cmake' and 'DCMTKConfigVersion.cmake
GET_PROPERTY(DCMTK_EXECUTABLE_TARGETS GLOBAL PROPERTY DCMTK_EXECUTABLE_TARGETS)
EXPORT(TARGETS ${DCMTK_EXECUTABLE_TARGETS} APPEND FILE ${DCMTK_BUILD_CMKDIR}/DCMTKTargets.cmake)
GET_PROPERTY(DCMTK_LIBRARY_TARGETS GLOBAL PROPERTY DCMTK_LIBRARY_TARGETS)
EXPORT(TARGETS ${DCMTK_LIBRARY_TARGETS} APPEND FILE ${DCMTK_BUILD_CMKDIR}/DCMTKTargets.cmake)

SET(dcmtk_config_version ${DCMTK_BUILD_CMKDIR}/DCMTKConfigVersion.cmake)
write_basic_package_version_file(
    ${dcmtk_config_version}
    VERSION ${DCMTK_MAJOR_VERSION}.${DCMTK_MINOR_VERSION}.${DCMTK_BUILD_VERSION}
    COMPATIBILITY SameMajorVersion)

# Configure 'DCMTKConfig.cmake' for a build tree
SET(DCMTK_CMKDIR_CONFIG ${DCMTK_BUILD_CMKDIR})
SET(DCMTK_config_INCLUDE_DIR_CONFIG ${DCMTK_BINARY_DIR}/config/include/dcmtk/config)
SET(INCLUDE_PATH_VARS DCMTK_config_INCLUDE_DIR_CONFIG)
FOREACH(module ${DCMTK_MODULES})
    SET(DCMTK_${module}_INCLUDE_DIR_CONFIG ${DCMTK_SOURCE_DIR}/${module}/include/dcmtk/${module})
    list(APPEND INCLUDE_PATH_VARS DCMTK_${module}_INCLUDE_DIR_CONFIG)
ENDFOREACH(module)
SET(DCMTK_CONFIG_CODE "####### Expanded from \@DCMTK_CONFIG_CODE\@ #######\n")
SET(DCMTK_CONFIG_CODE "${DCMTK_CONFIG_CODE}list(APPEND DCMTK_INCLUDE_DIRS \"${DCMTK_BINARY_DIR}/config/include\")\n")
FOREACH(module ${DCMTK_MODULES})
    SET(DCMTK_CONFIG_CODE "${DCMTK_CONFIG_CODE}list(APPEND DCMTK_INCLUDE_DIRS \"${DCMTK_SOURCE_DIR}/${module}/include\")\n")
ENDFOREACH(module)
SET(DCMTK_CONFIG_CODE "${DCMTK_CONFIG_CODE}##################################################")
SET(dcmtk_config ${DCMTK_BUILD_CMKDIR}/DCMTKConfig.cmake)
configure_package_config_file(
    CMake/DCMTKConfig.cmake.in
    ${dcmtk_config}
    INSTALL_DESTINATION ${CMAKE_BINARY_DIR}
    PATH_VARS DCMTK_CMKDIR_CONFIG ${INCLUDE_PATH_VARS}
    NO_CHECK_REQUIRED_COMPONENTS_MACRO)

# Configure 'DCMTKConfig.cmake' for an install tree
SET(DCMTK_CMKDIR_CONFIG ${DCMTK_INSTALL_CMKDIR})
SET(DCMTK_config_INCLUDE_DIR_CONFIG ${DCMTK_INSTALL_INCDIR}/dcmtk/config)
SET(INCLUDE_PATH_VARS DCMTK_config_INCLUDE_DIR_CONFIG)
FOREACH(module ${DCMTK_MODULES})
    SET(DCMTK_${module}_INCLUDE_DIR_CONFIG ${DCMTK_INSTALL_INCDIR}/dcmtk/${module})
    list(APPEND INCLUDE_PATH_VARS DCMTK_${module}_INCLUDE_DIR_CONFIG)
ENDFOREACH(module)
SET(DCMTK_CONFIG_CODE "####### Expanded from \@DCMTK_CONFIG_CODE\@ #######\n")
SET(DCMTK_CONFIG_CODE "${DCMTK_CONFIG_CODE}list(APPEND DCMTK_INCLUDE_DIRS \"\${PACKAGE_PREFIX_DIR}/include\")\n")
SET(DCMTK_CONFIG_CODE "${DCMTK_CONFIG_CODE}##################################################")
SET(dcmtk_install_config ${CMAKE_BINARY_DIR}/CMakeFiles/DCMTKConfig.cmake)
configure_package_config_file(
    CMake/DCMTKConfig.cmake.in
    ${dcmtk_install_config}
    INSTALL_DESTINATION ${CMAKE_INSTALL_PREFIX}/${DCMTK_INSTALL_CMKDIR}
    PATH_VARS DCMTK_CMKDIR_CONFIG ${INCLUDE_PATH_VARS}
    NO_CHECK_REQUIRED_COMPONENTS_MACRO)

# Install 'DCMTKTargets.cmake', 'DCMTKConfig.cmake' and 'DCMTKConfigVersion.cmake
INSTALL(EXPORT DCMTKTargets FILE DCMTKTargets.cmake
        DESTINATION ${DCMTK_INSTALL_CMKDIR} COMPONENT cmake)

INSTALL(FILES ${dcmtk_install_config} ${dcmtk_config_version}
        DESTINATION ${DCMTK_INSTALL_CMKDIR} COMPONENT cmake)

ENDIF(HAVE_CONFIGURE_PACKAGE_CONFIG_FILE AND HAVE_WRITE_BASIC_PACKAGE_VERSION_FILE)
