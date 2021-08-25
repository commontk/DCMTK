# create library from source files
DCMTK_ADD_LIBRARY(dcmdsig
  dcsighlp.cc
  dcsignat.cc
  siautopr.cc
  sibrsapr.cc
  sicert.cc
  sicertvf.cc
  sicreapr.cc
  sidsa.cc
  siecdsa.cc
  simaccon.cc
  simd5.cc
  sinullpr.cc
  siprivat.cc
  sipurpos.cc
  siripemd.cc
  sirsa.cc
  sisha1.cc
  sisprof.cc
  sisrpr.cc
  sisrvpr.cc
  sitstamp.cc
  sitypes.cc
  sisha256.cc
  sisha384.cc
  sisha512.cc
  sitsfs.cc
)

DCMTK_TARGET_LINK_MODULES(dcmdsig ofstd dcmdata)
DCMTK_TARGET_LINK_LIBRARIES(dcmdsig ${OPENSSL_LIBS})
