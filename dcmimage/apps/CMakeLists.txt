# declare executables
FOREACH(PROGRAM dcm2pnm dcmquant dcmscale)
  ADD_EXECUTABLE(${PROGRAM} ${PROGRAM})
ENDFOREACH(PROGRAM)

# make sure executables are linked to the corresponding libraries
FOREACH(PROGRAM dcm2pnm dcmquant dcmscale)
  TARGET_LINK_LIBRARIES(${PROGRAM} ofstd dcmdata dcmimgle dcmimage ${ZLIB_LIBS} ${DCMTK_LIBRARIES})
ENDFOREACH(PROGRAM)
TARGET_LINK_LIBRARIES(dcm2pnm ${LIBTIFF_LIBS} ${LIBPNG_LIBS})

# Install rules
SET(targets dcm2pnm dcmquant dcmscale)
FOREACH(target ${targets})
  INSTALL(TARGETS ${target}
    DESTINATION ${DCMTK_INSTALL_BIN_DIR} COMPONENT Development
    )
ENDFOREACH()
