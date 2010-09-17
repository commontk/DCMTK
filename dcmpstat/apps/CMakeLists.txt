# declare executables
FOREACH(PROGRAM dcmmkcrv dcmmklut dcmp2pgm dcmprscp dcmprscu dcmpsmk dcmpsprt dcmpsrcv dcmpssnd)
  ADD_EXECUTABLE(${PROGRAM} ${PROGRAM})
ENDFOREACH(PROGRAM)
ADD_EXECUTABLE(dcmpschk dcmpschk)

# make sure executables are linked to the corresponding libraries
FOREACH(PROGRAM dcmmkcrv dcmmklut dcmp2pgm dcmprscp dcmprscu dcmpsmk dcmpschk dcmpsprt dcmpsrcv dcmpssnd)
  TARGET_LINK_LIBRARIES(${PROGRAM} dcmpstat ${ZLIB_LIBS})
  IF(WIN32)
    TARGET_LINK_LIBRARIES(${PROGRAM}  ws2_32 netapi32 wsock32)
  ENDIF(WIN32)
ENDFOREACH(PROGRAM)
FOREACH(PROGRAM dcmmklut dcmp2pgm dcmprscp dcmprscu dcmpschk dcmpsmk dcmpsprt dcmpsrcv dcmpssnd)
  TARGET_LINK_LIBRARIES(${PROGRAM} dcmsr)
ENDFOREACH(PROGRAM)
FOREACH(PROGRAM dcmp2pgm dcmprscp dcmprscu dcmpsprt dcmpsrcv dcmpssnd)
  TARGET_LINK_LIBRARIES(${PROGRAM} dcmtls dcmdsig ${LIBXML_LIBS} ${OPENSSL_LIBS})
ENDFOREACH(PROGRAM)

# Install rules
SET(targets dcmmkcrv dcmmklut dcmp2pgm dcmprscp dcmprscu dcmpsmk dcmpsprt dcmpsrcv dcmpssnd dcmpschk)
FOREACH(target ${targets})
  INSTALL(TARGETS ${target}
    DESTINATION ${DCMTK_INSTALL_BIN_DIR} COMPONENT Development
    )
ENDFOREACH()
