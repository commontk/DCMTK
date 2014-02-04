# declare executables
FOREACH(PROGRAM dcm2xml dcmconv dcmcrle dcmdrle dcmdump dcmftest dcmgpdir dump2dcm xml2dcm pdf2dcm)
  ADD_EXECUTABLE(${PROGRAM} ${PROGRAM})
ENDFOREACH(PROGRAM)
ADD_EXECUTABLE(dcmodify dcmodify mdfconen mdfdsman)

# make sure executables are linked to the corresponding libraries
FOREACH(PROGRAM dcm2xml dcmconv dcmcrle dcmdrle dcmdump dcmgpdir dcmodify dump2dcm xml2dcm pdf2dcm)
  TARGET_LINK_LIBRARIES(${PROGRAM} dcmdata ${LIBXML_LIBS} ${OPENSSL_LIBS} ${ZLIB_LIBS} ${DCMTK_LIBRARIES})
ENDFOREACH(PROGRAM)
TARGET_LINK_LIBRARIES(dcmftest ofstd ${ZLIB_LIBS})


# Install rules
SET(targets dcm2xml dcmconv dcmcrle dcmdrle dcmdump dcmftest dcmgpdir dump2dcm xml2dcm pdf2dcm dcmodify)
FOREACH(target ${targets})
  INSTALL(TARGETS ${target}
    DESTINATION ${DCMTK_INSTALL_BIN_DIR} COMPONENT Development
    )
ENDFOREACH()
