# -----------------------------------------------------------------
# Start of common section
ADD_LIBRARY(${KIT} ${Kit_SRCS} ${Kit_EXTRA_SRCS})
SET_TARGET_PROPERTIES(${KIT} PROPERTIES ${DCMTK_LIBRARY_PROPERTIES})
TARGET_LINK_LIBRARIES(${KIT} ${KIT_LIBS} ${KIT_EXTRA_LIBS})



INSTALL(TARGETS ${KIT}
  DESTINATION ${DCMTK_INSTALL_LIB_DIR} COMPONENT Development
  )

# End of common section
# -----------------------------------------------------------------
