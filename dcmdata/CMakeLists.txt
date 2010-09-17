# declare project
PROJECT(dcmdata)

# recurse into subdirectories
ADD_SUBDIRECTORY(libsrc)

# build the apps
IF(DCMTK_BUILD_APPS)
  ADD_SUBDIRECTORY(apps)
ENDIF(DCMTK_BUILD_APPS)
