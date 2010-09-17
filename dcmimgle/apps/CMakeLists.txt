# declare executables
FOREACH(PROGRAM dcmdspfn dcod2lum dconvlum)
  ADD_EXECUTABLE(${PROGRAM} ${PROGRAM})
ENDFOREACH(PROGRAM)

# make sure executables are linked to the corresponding libraries
FOREACH(PROGRAM dcmdspfn dcod2lum dconvlum)
  TARGET_LINK_LIBRARIES(${PROGRAM} ofstd dcmimgle ${ZLIB_LIBS} ${DCMTK_LIBRARIES})
ENDFOREACH(PROGRAM)
TARGET_LINK_LIBRARIES(dcmdspfn dcmdata)

# Install rules
SET(targets dcmdspfn dcod2lum dconvlum)
FOREACH(target ${targets})
  INSTALL(TARGETS ${target}
    DESTINATION ${DCMTK_INSTALL_BIN_DIR} COMPONENT Development
    )
ENDFOREACH()
