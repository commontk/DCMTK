# declare project
PROJECT(dcmimage)

# recurse into subdirectories
ADD_SUBDIRECTORY(libsrc) 

IF(DCMTK_BUILD_APPS)
  ADD_SUBDIRECTORY(apps)
ENDIF(DCMTK_BUILD_APPS)
