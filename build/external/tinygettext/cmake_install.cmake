# Install script for directory: /Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/external/tinygettext

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set path to fallback-tool for dependency-resolution.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/build/external/tinygettext/libtinygettext.a")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtinygettext.a" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtinygettext.a")
    execute_process(COMMAND "/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtinygettext.a")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/tinygettext" TYPE FILE FILES
    "/Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/external/tinygettext/include/tinygettext/dictionary.hpp"
    "/Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/external/tinygettext/include/tinygettext/dictionary_manager.hpp"
    "/Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/external/tinygettext/include/tinygettext/file_system.hpp"
    "/Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/external/tinygettext/include/tinygettext/iconv.hpp"
    "/Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/external/tinygettext/include/tinygettext/language.hpp"
    "/Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/external/tinygettext/include/tinygettext/log.hpp"
    "/Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/external/tinygettext/include/tinygettext/log_stream.hpp"
    "/Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/external/tinygettext/include/tinygettext/plural_forms.hpp"
    "/Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/external/tinygettext/include/tinygettext/po_parser.hpp"
    "/Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/external/tinygettext/include/tinygettext/tinygettext.hpp"
    "/Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/external/tinygettext/include/tinygettext/unix_file_system.hpp"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/build/external/tinygettext/tinygettext.pc")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/build/external/tinygettext/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
