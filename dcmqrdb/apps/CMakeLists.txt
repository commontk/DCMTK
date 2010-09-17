# declare executables
FOREACH(PROGRAM dcmqrscp dcmqridx dcmqrti)
  ADD_EXECUTABLE(${PROGRAM} ${PROGRAM})
ENDFOREACH(PROGRAM)

# make sure executables are linked to the corresponding libraries
FOREACH(PROGRAM dcmqrscp dcmqridx dcmqrti)
  TARGET_LINK_LIBRARIES(${PROGRAM} dcmqrdb ${ZLIB_LIBS})
  IF(WIN32)
    TARGET_LINK_LIBRARIES(${PROGRAM}  ws2_32 netapi32 wsock32)
  ENDIF(WIN32)
ENDFOREACH(PROGRAM)

# Install rules
SET(targets dcmqrscp dcmqridx dcmqrti)
FOREACH(target ${targets})
  INSTALL(TARGETS ${target}
    DESTINATION ${DCMTK_INSTALL_BIN_DIR} COMPONENT Development
    )
ENDFOREACH()
