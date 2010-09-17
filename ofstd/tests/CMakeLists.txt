FILE(GLOB TEST_FILES "*.cc")

SET(IGNORE_TESTS "dummy")  # avoid CMake complaints
IF(NOT WITH_THREADS)
  SET(IGNORE_TESTS ${IGNORE_TESTS} "tstthred.cc")
ENDIF(NOT WITH_THREADS)

FOREACH (filepath ${TEST_FILES})
  FILE(RELATIVE_PATH filename ${VTKDCMTK_SOURCE_DIR}/ofstd/tests ${filepath})
  GET_FILENAME_COMPONENT(basename ${filename} NAME_WE)

  STRING(REGEX MATCH ${filename} ignore_it ${IGNORE_TESTS})
  IF(NOT ignore_it)
    ADD_EXECUTABLE(${basename} ${filename})
    TARGET_LINK_LIBRARIES(${basename} ofstd)
    ADD_TEST(vtkdcmtk-ofstd-${basename} ${CXX_TEST_PATH}/${basename})
  ENDIF(NOT ignore_it)

ENDFOREACH (filepath ${TEST_FILES})
