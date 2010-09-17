SET(KIT oflog)
SET(UKIT OFLOG)

SET(Kit_SRCS
apndimpl.cc
appender.cc
config.cc
consap.cc
factory.cc
fileap.cc
filter.cc
globinit.cc
hierarchy.cc
hierlock.cc
layout.cc
lloguser.cc
logevent.cc
logger.cc
logimpl.cc
loglevel.cc
loglog.cc
ndc.cc
ntelogap.cc
nullap.cc
objreg.cc
oflog.cc
patlay.cc
pointer.cc
property.cc
rootlog.cc
sleep.cc
sockbuff.cc
socket.cc
socketap.cc
strhelp.cc
syncprims.cc
syslogap.cc
threads.cc
timehelp.cc
)

IF(WIN32)
  SET(Kit_SRCS ${Kit_SRCS} windebap.cc winsock.cc)
ELSE(WIN32)
  SET(Kit_SRCS ${Kit_SRCS} unixsock.cc)
ENDIF(WIN32)


SET(KIT_LIBS oflog)
SET(Kit_EXTRA_SRCS)

# Include CMake code common to all dcmtk kits.
INCLUDE(${DCMTK_SOURCE_DIR}/CMake/KitCommonBlock.cmake)
