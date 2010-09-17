SET(KIT dcmjpeg)
SET(UKIT DCMJPEG)

SET(Kit_SRCS
ddpiimpl.cc
dipijpeg.cc
djcodecd.cc
djcodece.cc
djcparam.cc
djdecbas.cc
djdecext.cc
djdeclol.cc
djdecode.cc
djdecpro.cc
djdecsps.cc
djdecsv1.cc
djdijg12.cc
djdijg16.cc
djdijg8.cc
djeijg12.cc
djeijg16.cc
djeijg8.cc
djencbas.cc
djencext.cc
djenclol.cc
djencode.cc
djencpro.cc
djencsps.cc
djencsv1.cc
djrplol.cc
djrploss.cc
djutils.cc
)

SET(Kit_EXTRA_SRCS)
SET(KIT_LIBS dcmimgle ijg8 ijg12 ijg16)
SET(KIT_EXTRA_LIBS ${ZLIB_LIBS})

# Include CMake code common to all dcmtk kits.
INCLUDE(${DCMTK_SOURCE_DIR}/CMake/KitCommonBlock.cmake)
