# Install script for directory: /Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pixmaps" TYPE FILE FILES
    "/Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/data/images/engine/icons/supertux-nightly.png"
    "/Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/data/images/engine/icons/supertux.xpm"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/icons/hicolor/128x128/apps" TYPE FILE FILES "/Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/data/images/engine/icons/supertux-nightly.png")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/applications" TYPE FILE FILES "/Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/build/supertux2.desktop")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/icons/hicolor/scalable/apps" TYPE FILE FILES "/Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/supertux2.svg")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/games" TYPE EXECUTABLE FILES "/Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/build/supertux2")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/games/supertux2" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/games/supertux2")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/homebrew/Cellar/sdl2/2.32.10/lib"
      -delete_rpath "/Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/build/external/simplesquirrel"
      -delete_rpath "/opt/homebrew/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/games/supertux2")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" -u -r "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/games/supertux2")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  include("/Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/build/CMakeFiles/supertux2.dir/install-cxx-module-bmi-Release.cmake" OPTIONAL)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/build/external/simplesquirrel/libsimplesquirrel.dylib")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsimplesquirrel.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsimplesquirrel.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" -x "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsimplesquirrel.dylib")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/supertux2" TYPE FILE FILES
    "/Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/README.md"
    "/Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/LICENSE.txt"
    "/Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/NEWS.md"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/games/supertux2" TYPE FILE FILES "/Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/data/credits.stxt")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/metainfo" TYPE FILE FILES "/Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/org.supertuxproject.SuperTux.metainfo.xml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/games/supertux2" TYPE DIRECTORY FILES
    "/Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/data/images"
    "/Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/data/fonts"
    "/Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/data/music"
    "/Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/data/particles"
    "/Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/data/scripts"
    "/Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/data/shader"
    "/Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/data/speech"
    "/Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/data/sounds"
    "/Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/data/locale"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/games/supertux2" TYPE DIRECTORY FILES "/Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/data/levels" REGEX "/data\\/levels\\/test$" EXCLUDE REGEX "/data\\/levels\\/test\\_old$" EXCLUDE REGEX "/data\\/levels\\/incubator$" EXCLUDE)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/MacOS" TYPE FILE RENAME "libpng.dylib" FILES "/opt/homebrew/Cellar/libpng/1.6.53/lib/libpng16.16.dylib")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/MacOS" TYPE FILE RENAME "libz.tbd" FILES "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/lib/libz.1.tbd")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/MacOS" TYPE FILE RENAME "libjpeg.dylib" FILES "/opt/homebrew/Cellar/jpeg-turbo/3.1.2/lib/libjpeg.8.3.2.dylib")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  
       if("$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/" MATCHES ".*\\.app.*")
       include(BundleUtilities)
       fixup_bundle("$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/games/supertux2"   ""   "/Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/build/external/tinygettext;/Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/build/external/simplesquirrel")
       endif()
       
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/build/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
if(CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_COMPONENT MATCHES "^[a-zA-Z0-9_.+-]+$")
    set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
  else()
    string(MD5 CMAKE_INST_COMP_HASH "${CMAKE_INSTALL_COMPONENT}")
    set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INST_COMP_HASH}.txt")
    unset(CMAKE_INST_COMP_HASH)
  endif()
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/Users/mdnezamuddin/Study /7th Semester/Practice in software development/penguin adventure/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
