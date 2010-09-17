SET(KIT dcmnet)
SET(UKIT DCMNET)

file(GLOB Kit_SRCS ../include/dcmtk/dcmnet/*.h *.cc)

SET(Kit_EXTRA_SRCS)
SET(KIT_LIBS dcmdata)
SET(KIT_EXTRA_LIBS)

# Include CMake code common to all dcmtk kits.
INCLUDE(${DCMTK_SOURCE_DIR}/CMake/KitCommonBlock.cmake)
