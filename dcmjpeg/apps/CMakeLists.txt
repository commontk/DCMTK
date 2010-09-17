INCLUDE_DIRECTORIES(${DCMTK_SOURCE_DIR}/dcmdata/apps ${DCMTK_SOURCE_DIR}/dcmimage/apps)

# declare executables
FOREACH(PROGRAM dcmcjpeg dcmdjpeg dcmj2pnm dcmmkdir)
  ADD_EXECUTABLE(${PROGRAM} ${PROGRAM})
ENDFOREACH(PROGRAM)

# make sure executables are linked to the corresponding libraries
FOREACH(PROGRAM dcmcjpeg dcmdjpeg dcmj2pnm dcmmkdir)
  TARGET_LINK_LIBRARIES(${PROGRAM} ofstd dcmdata dcmimgle dcmimage dcmjpeg ijg8 ijg12 ijg16 ${ZLIB_LIBS})
  IF(WIN32)
    TARGET_LINK_LIBRARIES(${PROGRAM}  ws2_32 netapi32 wsock32)
  ENDIF(WIN32)
ENDFOREACH(PROGRAM)
TARGET_LINK_LIBRARIES(dcmj2pnm ${LIBTIFF_LIBS} ${LIBPNG_LIBS})

# Install rules
SET(targets dcmdjpeg dcmj2pnm dcmmkdir)
FOREACH(target ${targets})
  INSTALL(TARGETS ${target}
    DESTINATION ${DCMTK_INSTALL_BIN_DIR} COMPONENT Development
    )
ENDFOREACH()
