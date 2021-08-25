# create library from source files
DCMTK_ADD_LIBRARY(i2d
  i2d.cc
  i2dplvlp.cc
  i2djpgs.cc
  i2dbmps.cc
  i2dplsc.cc
  i2dplnsc.cc
)

DCMTK_TARGET_LINK_MODULES(i2d dcmdata)
