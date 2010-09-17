SET(KIT ofstd)
SET(UKIT OFSTD)

SET(Kit_SRCS
ofcmdln.cc   
ofconapp.cc  
ofcond.cc    
ofconfig.cc  
ofconsol.cc  
ofcrc32.cc   
ofdate.cc    
ofdatime.cc 
offname.cc   
oflist.cc    
ofstd.cc     
ofstring.cc
ofthread.cc
oftime.cc
)

SET(Kit_EXTRA_SRCS)
SET(KIT_LIBS ${THREAD_LIBS})
SET(KIT_EXTRA_LIBS)

# Include CMake code common to all dcmtk kits.
INCLUDE(${DCMTK_SOURCE_DIR}/CMake/KitCommonBlock.cmake)
