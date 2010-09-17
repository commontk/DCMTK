SET(KIT dcmqrdb)
SET(UKIT DCMQRB)

SET(Kit_SRCS
dcmqrcbf.cc 
dcmqrcbm.cc 
dcmqrcnf.cc 
dcmqrdbs.cc 
dcmqrptb.cc 
dcmqrtis.cc
dcmqrcbg.cc 
dcmqrcbs.cc 
dcmqrdbi.cc 
dcmqropt.cc 
dcmqrsrv.cc
)

SET(Kit_EXTRA_SRCS)
SET(KIT_LIBS dcmnet)
SET(KIT_EXTRA_LIBS)

# Include CMake code common to all dcmtk kits.
INCLUDE(${DCMTK_SOURCE_DIR}/CMake/KitCommonBlock.cmake)
