PROJECT(dcmpstat)

# recurse into subdirectories
ADD_SUBDIRECTORY(libsrc)

# build the apps
IF(DCMTK_BUILD_APPS)
  ADD_SUBDIRECTORY(apps)
ENDIF(DCMTK_BUILD_APPS)

# build the vtkdcmtk tests
IF(BUILD_TESTING)
  ADD_SUBDIRECTORY(tests)
ENDIF(BUILD_TESTING)

