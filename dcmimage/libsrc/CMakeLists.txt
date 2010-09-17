SET(KIT dcmimage)
SET(UKIT DCMIMAGE)

SET(Kit_SRCS
diargimg.cc
dicmyimg.cc
dicoimg.cc
dicoopx.cc
dicopx.cc
dihsvimg.cc
dipalimg.cc
dipipng.cc
dipitiff.cc
diqtctab.cc
diqtfs.cc
diqthash.cc
diqthitl.cc
diqtpbox.cc
diquant.cc
diregist.cc
dirgbimg.cc
diybrimg.cc
diyf2img.cc
diyp2img.cc
dilogger.cc
)

SET(Kit_EXTRA_SRCS)
SET(KIT_LIBS ofstd dcmimgle)
SET(KIT_EXTRA_LIBS)

# PNG
IF(DCMTK_WITH_PNG)
  SET(KIT_EXTRA_LIBS ${KIT_EXTRA_LIBS} ${PNG_LIBRARIES})
ENDIF(DCMTK_WITH_PNG)

# TIFF
IF(DCMTK_WITH_TIFF)
  SET(KIT_EXTRA_LIBS ${KIT_EXTRA_LIBS} ${TIFF_LIBRARIES})
ENDIF(DCMTK_WITH_TIFF)

# Include CMake code common to all dcmtk kits.
INCLUDE(${DCMTK_SOURCE_DIR}/CMake/KitCommonBlock.cmake)
