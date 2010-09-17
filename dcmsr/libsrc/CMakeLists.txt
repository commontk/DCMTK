SET(KIT dcmsr)
SET(UKIT DCMSR)

SET(Kit_SRCS
dsrbascc.cc
dsrchecc.cc
dsrcitem.cc
dsrcodtn.cc
dsrcodvl.cc
dsrcomcc.cc
dsrcomtn.cc
dsrcomvl.cc
dsrcontn.cc
dsrcsidl.cc
dsrdattn.cc
dsrdoc.cc
dsrdoctn.cc
dsrdoctr.cc
dsrdtitn.cc
dsrenhcc.cc
dsrimgfr.cc
dsrimgtn.cc
dsrimgvl.cc
dsriodcc.cc
dsrkeycc.cc
dsrmamcc.cc
dsrnumtn.cc
dsrnumvl.cc
dsrpnmtn.cc
dsrprocc.cc
dsrreftn.cc
dsrscogr.cc
dsrscotn.cc
dsrscovl.cc
dsrsoprf.cc
dsrstrvl.cc
dsrtcodt.cc
dsrtcosp.cc
dsrtcotn.cc
dsrtcoto.cc
dsrtcovl.cc
dsrtextn.cc
dsrtimtn.cc
dsrtncsr.cc
dsrtree.cc
dsrtypes.cc
dsruidtn.cc
dsrwavch.cc
dsrwavtn.cc
dsrwavvl.cc
dsrxmlc.cc
dsrxmld.cc
dsrxrdcc.cc
)

SET(Kit_EXTRA_SRCS)
SET(KIT_LIBS dcmdata oflog)
SET(KIT_EXTRA_LIBS)

# Include CMake code common to all dcmtk kits.
INCLUDE(${DCMTK_SOURCE_DIR}/CMake/KitCommonBlock.cmake)
