# Install script for directory: /home/james/Desktop/gazebo_devel/ros_gazebo_devel/src/ros_gazebo_devel

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/james/Desktop/gazebo_devel/ros_gazebo_devel/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
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

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ros_gazebo_devel/cmake" TYPE FILE FILES "/home/james/Desktop/gazebo_devel/ros_gazebo_devel/build/ros_gazebo_devel/catkin_generated/installspace/ros_gazebo_devel-msg-paths.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/james/Desktop/gazebo_devel/ros_gazebo_devel/devel/share/roseus/ros/ros_gazebo_devel")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python" -m compileall "/home/james/Desktop/gazebo_devel/ros_gazebo_devel/devel/lib/python2.7/dist-packages/ros_gazebo_devel")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/james/Desktop/gazebo_devel/ros_gazebo_devel/devel/lib/python2.7/dist-packages/ros_gazebo_devel")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/james/Desktop/gazebo_devel/ros_gazebo_devel/build/ros_gazebo_devel/catkin_generated/installspace/ros_gazebo_devel.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ros_gazebo_devel/cmake" TYPE FILE FILES "/home/james/Desktop/gazebo_devel/ros_gazebo_devel/build/ros_gazebo_devel/catkin_generated/installspace/ros_gazebo_devel-msg-extras.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ros_gazebo_devel/cmake" TYPE FILE FILES
    "/home/james/Desktop/gazebo_devel/ros_gazebo_devel/build/ros_gazebo_devel/catkin_generated/installspace/ros_gazebo_develConfig.cmake"
    "/home/james/Desktop/gazebo_devel/ros_gazebo_devel/build/ros_gazebo_devel/catkin_generated/installspace/ros_gazebo_develConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ros_gazebo_devel" TYPE FILE FILES "/home/james/Desktop/gazebo_devel/ros_gazebo_devel/src/ros_gazebo_devel/package.xml")
endif()

