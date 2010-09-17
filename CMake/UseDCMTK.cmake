# Setup the same variable that FindDCMTK.cmake would
SET(DCMTK_LIBRARIES
  dcmimgle 
  dcmjpeg     
  dcmimage 
  dcmdata
  oflog
  ofstd 
)

IF( WIN32 )
  SET( DCMTK_LIBRARIES ${DCMTK_LIBRARIES} ws2_32 netapi32 wsock32)
ENDIF( WIN32 )

SET(DCMTK_INCLUDE_DIR
  ${DCMTK_BINARY_DIR}/include
  ${DCMTK_SOURCE_DIR}/dcmimgle/include
  ${DCMTK_SOURCE_DIR}/ofstd/include
  ${DCMTK_SOURCE_DIR}/oflog/include
  ${DCMTK_SOURCE_DIR}/dcmdata/include
  ${DCMTK_SOURCE_DIR}/dcmimage/include
  ${DCMTK_SOURCE_DIR}/dcmjpeg/libijg8
  ${DCMTK_SOURCE_DIR}/dcmjpeg/libijg12
  ${DCMTK_SOURCE_DIR}/dcmjpeg/libijg16
  ${DCMTK_SOURCE_DIR}/dcmjpeg/include
  ${DCMTK_SOURCE_DIR}/dcmnet/include
  ${DCMTK_SOURCE_DIR}/dcmpstat/include
  ${DCMTK_SOURCE_DIR}/dcmsr/include
  ${DCMTK_SOURCE_DIR}/dcmqrdb/include
  ${DCMTK_SOURCE_DIR}/dcmsign/include
  ${DCMTK_SOURCE_DIR}/dcmwlm/include
)

IF(DCMTK_BUILD_EXPERIMENTAL)
  SET(DCMTK_LIBRARIES ${DCMTK_LIBRARIES}
    dcmtls 
    dcmnet 
    dcmqrdb   
    dcmdsig
    dcmsr 
    dcmpstat 
    dcmwlm
    )

  SET(DCMTK_INCLUDE_DIR ${DCMTK_INCLUDE_DIR}
    ${DCMTK_SOURCE_DIR}/dcmtls/include
    ${DCMTK_SOURCE_DIR}/dcmnet/include
    ${DCMTK_SOURCE_DIR}/dcmqrdb/include
    ${DCMTK_SOURCE_DIR}/dcmsign/include
    ${DCMTK_SOURCE_DIR}/dcmsr/include
    ${DCMTK_SOURCE_DIR}/dcmwlm/include
    ${DCMTK_SOURCE_DIR}/dcmpstat/include
    )
ENDIF(DCMTK_BUILD_EXPERIMENTAL)

INCLUDE_DIRECTORIES(${DCMTK_INCLUDE_DIR})
