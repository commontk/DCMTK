SET(KIT dcmdata)
SET(UKIT DCMDATA)

SET(Kit_SRCS
dcbytstr.cc
dcchrstr.cc
dccodec.cc
dcdatset.cc
dcddirif.cc
dcdicdir.cc
dcdicent.cc
dcdict.cc
dcdictzz.cc # the builtin dictionary
dcdirrec.cc
dcelem.cc
dcerror.cc
dcfilefo.cc
dchashdi.cc
dcistrma.cc
dcistrmb.cc
dcistrmf.cc
dcistrmz.cc
dcitem.cc
dclist.cc
dcmetinf.cc
dcobject.cc
dcostrma.cc
dcostrmb.cc
dcostrmf.cc
dcostrmz.cc
dcpcache.cc
dcpixel.cc
dcpixseq.cc
dcpxitem.cc
dcrleccd.cc
dcrlecce.cc
dcrlecp.cc
dcrledrg.cc
dcrleerg.cc
dcrlerp.cc
dcsequen.cc
dcstack.cc
dcswap.cc
dctag.cc
dctagkey.cc
dctypes.cc
dcuid.cc
dcvm.cc
dcvrae.cc
dcvras.cc
dcvrat.cc
dcvrcs.cc
dcvr.cc
dcvrda.cc
dcvrds.cc
dcvrdt.cc
dcvrfd.cc
dcvrfl.cc
dcvris.cc
dcvrlo.cc
dcvrlt.cc
dcvrobow.cc
dcvrof.cc
dcvrpn.cc
dcvrpobw.cc
dcvrsh.cc
dcvrsl.cc
dcvrss.cc
dcvrst.cc
dcvrtm.cc
dcvrui.cc
dcvrul.cc
dcvrulup.cc
dcvrus.cc
dcvrut.cc
dcxfer.cc
vrscan.cc
dcwcache.cc
cmdlnarg.cc
dcpath.cc
)

SET(KIT_LIBS ofstd oflog)
SET(Kit_EXTRA_SRCS)

# Include CMake code common to all dcmtk kits.
INCLUDE(${DCMTK_SOURCE_DIR}/CMake/KitCommonBlock.cmake)


