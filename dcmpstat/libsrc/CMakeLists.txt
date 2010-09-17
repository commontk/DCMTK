SET(KIT dcmpstat)
SET(UKIT DCMPSTAT)

SET(Kit_SRCS
dcmpstat.cc
dviface.cc
dvpsab.cc
dvpsabl.cc
dvpsal.cc
dvpsall.cc
dvpscf.cc
dvpscu.cc
dvpscul.cc
dvpsda.cc
dvpsdal.cc
dvpsfs.cc
dvpsga.cc
dvpsgal.cc
dvpsgl.cc
dvpsgll.cc
dvpsgr.cc
dvpsgrl.cc
dvpshlp.cc
dvpsib.cc
dvpsibl.cc
dvpsmsg.cc
dvpsov.cc
dvpsovl.cc
dvpspl2.cc
dvpspl.cc
dvpspll.cc
dvpspr.cc
dvpsprt.cc
dvpsri.cc
dvpsril.cc
dvpsrs.cc
dvpsrsl.cc
dvpssp.cc
dvpsspl.cc
dvpssv.cc
dvpssvl.cc
dvpstat.cc
dvpstx.cc
dvpstxl.cc
dvpsvl.cc
dvpsvll.cc
dvpsvw.cc
dvpsvwl.cc
dvsighdl.cc
)

SET(Kit_EXTRA_SRCS)
SET(KIT_LIBS dcmdata dcmqrdb dcmimage dcmsr)
SET(KIT_EXTRA_LIBS)

# Include CMake code common to all dcmtk kits.
INCLUDE(${DCMTK_SOURCE_DIR}/CMake/KitCommonBlock.cmake)
