# declare executables
FOREACH(PROGRAM dsr2html dsr2xml dsrdump xml2dsr)
  ADD_EXECUTABLE(${PROGRAM} ${PROGRAM})
ENDFOREACH(PROGRAM)

# make sure executables are linked to the corresponding libraries
FOREACH(PROGRAM dsr2html dsr2xml dsrdump xml2dsr)
  TARGET_LINK_LIBRARIES(${PROGRAM} dcmsr ${ZLIB_LIBS} ${LIBXML_LIBS} ${DCMTK_LIBRARIES})
ENDFOREACH(PROGRAM)

# Install rules
SET(targets dsr2html dsr2xml dsrdump xml2dsr)
FOREACH(target ${targets})
  INSTALL(TARGETS ${target}
    DESTINATION ${DCMTK_INSTALL_BIN_DIR} COMPONENT Development
    )
ENDFOREACH()
