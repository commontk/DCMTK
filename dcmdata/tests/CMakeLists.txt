# declare executables
DCMTK_ADD_EXECUTABLE(dcmdata_tests
  tests.cc
  tpread.cc
  ti2dbmp.cc
  tchval.cc
  tpath.cc
  tvrdatim.cc
  telemlen.cc
  tparser.cc
  tdict.cc
  tvrds.cc
  tvrfd.cc
  tvrpn.cc
  tvrui.cc
  tvrol.cc
  tvrov.cc
  tvrsv.cc
  tvruv.cc
  tstrval.cc
  tspchrs.cc
  tparent.cc
  tfilter.cc
  tvrcomp.cc
  tmatch.cc
  tnewdcme.cc
  tgenuid.cc
  tsequen.cc
)

# make sure executables are linked to the corresponding libraries
DCMTK_TARGET_LINK_MODULES(dcmdata_tests i2d dcmdata oflog ofstd)

# This macro parses tests.cc and registers all tests
DCMTK_ADD_TESTS(dcmdata)
