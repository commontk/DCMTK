ADD_EXECUTABLE(dcmsign dcmsign)

# make sure executables are linked to the corresponding libraries
TARGET_LINK_LIBRARIES(dcmsign dcmdsig ${ZLIB_LIBS} ${OPENSSL_LIBS} ${DCMTK_LIBRARIES})

# Install rules
SET(targets dcmsign)
FOREACH(target ${targets})
  INSTALL(TARGETS ${target}
    DESTINATION ${DCMTK_INSTALL_BIN_DIR} COMPONENT Development
    )
ENDFOREACH()
