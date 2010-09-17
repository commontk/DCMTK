SET(KIT dcmimgle)
SET(UKIT DCMIMGLE)

SET(Kit_SRCS
dcmimage.cc
dibaslut.cc
diciefn.cc
dicielut.cc
didislut.cc
didispfn.cc
didocu.cc
digsdfn.cc
digsdlut.cc
diimage.cc
diinpx.cc
diluptab.cc
dimo1img.cc
dimo2img.cc
dimoimg3.cc
dimoimg4.cc
dimoimg5.cc
dimoimg.cc
dimomod.cc
dimoopx.cc
dimopx.cc
diovdat.cc
diovlay.cc
diovlimg.cc
diovpln.cc
diutils.cc
)

SET(KIT_LIBS dcmdata)
SET(Kit_EXTRA_SRCS)

# Include CMake code common to all dcmtk kits.
INCLUDE(${DCMTK_SOURCE_DIR}/CMake/KitCommonBlock.cmake)
