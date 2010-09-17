FILE(GLOB TEST_FILES "*.cc")

FOREACH (filepath ${TEST_FILES})
  FILE(RELATIVE_PATH filename ${DCMTK_SOURCE_DIR}/dcmpstat/tests ${filepath})
  GET_FILENAME_COMPONENT(basename ${filename} NAME_WE)

  ADD_EXECUTABLE(${basename} ${filename})
  TARGET_LINK_LIBRARIES(${basename} dcmpstat ${DCMTK_LIBRARIES})
  ADD_TEST(dcmtk-ofstd-${basename} ${CXX_TEST_PATH}/${basename})

ENDFOREACH (filepath ${TEST_FILES})
