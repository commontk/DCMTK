SET(KIT dcmdsig)
SET(UKIT DCMDSIG)

SET(Kit_SRCS
dcsignat.cc 
sicert.cc   
sidsa.cc    
sinullpr.cc 
sirsa.cc    
sitypes.cc
siautopr.cc 
sicertvf.cc 
simaccon.cc 
siprivat.cc 
sisha1.cc
sibrsapr.cc 
sicreapr.cc 
simd5.cc    
siripemd.cc 
sisprof.cc
)

SET(Kit_EXTRA_SRCS)
SET(KIT_LIBS dcmdata)
SET(KIT_EXTRA_LIBS)

# Include CMake code common to all dcmtk kits.
INCLUDE(${DCMTK_SOURCE_DIR}/CMake/KitCommonBlock.cmake)
