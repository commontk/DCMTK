# -----------------------------------------------------------------
# Start of common section
ADD_LIBRARY(${KIT} STATIC ${Kit_SRCS} ${Kit_EXTRA_SRCS})
TARGET_LINK_LIBRARIES(${KIT} ${KIT_LIBS} ${KIT_EXTRA_LIBS})

INSTALL(TARGETS ${KIT}
  DESTINATION ${DCMTK_INSTALL_LIB_DIR} COMPONENT Development
  )

# End of common section
# -----------------------------------------------------------------
