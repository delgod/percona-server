# This file includes build settings used for Percona Server release

OPTION(ENABLE_DOWNLOADS
  "Download and build 3rd party source code components, e.g. google mock, boost"
  ON)

IF(NOT DEFINED WITHOUT_TOKUDB AND NOT DEFINED WITHOUT_TOKUDB_STORAGE_ENGINE)
  OPTION(WITHOUT_TOKUDB "Include/exclude TOKUDB storage engine from build" ON)
ENDIF()

IF(NOT WITHOUT_TOKUDB)
  OPTION(DEBUG_EXTNAME "" OFF)
ENDIF()

OPTION(ENABLE_DTRACE "Enable Sun DTrace" OFF)
OPTION(WITH_INNODB_MEMCACHED "Generate memcached shared libraries" ON)
OPTION(WITH_EMBEDDED_SERVER "Compile MySQL with embedded server" OFF)
OPTION(WITH_PAM "Build with Percona PAM plugin" ON)

IF(NOT DEFINED DOWNLOAD_ROOT)
  SET(DOWNLOAD_ROOT ${CMAKE_SOURCE_DIR}/source_downloads)
ENDIF()

OPTION(DOWNLOAD_BOOST "Download boost from sourceforge." ${ENABLE_DOWNLOADS})
IF(NOT DEFINED WITH_BOOST)
  SET(WITH_BOOST ${DOWNLOAD_ROOT})
ENDIF()

IF(NOT DEFINED WITH_MECAB)
  SET(WITH_MECAB "system" CACHE STRING "Compile MeCab")
ENDIF()

IF(NOT DEFINED WITH_SSL)
  SET(WITH_SSL "system" CACHE STRING "Type of SSL support")
ENDIF()

IF(NOT COMPILATION_COMMENT)
  SET(COMPILATION_COMMENT "Percona Server for MySQL (GPL)")
ENDIF()

INCLUDE(${CMAKE_SOURCE_DIR}/cmake/build_configurations/mysql_release.cmake)
