# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(WARNING "Invoking generate_messages() without having added any message or service file before.
You should either add add_message_files() and/or add_service_files() calls or remove the invocation of generate_messages().")
message(STATUS "ros_gazebo_devel: 0 messages, 0 services")

set(MSG_I_FLAGS "-Igazebo_msgs:/opt/ros/lunar/share/gazebo_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/lunar/share/geometry_msgs/cmake/../msg;-Inav_msgs:/opt/ros/lunar/share/nav_msgs/cmake/../msg;-Istd_msgs:/opt/ros/lunar/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/lunar/share/sensor_msgs/cmake/../msg;-Itrajectory_msgs:/opt/ros/lunar/share/trajectory_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/lunar/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(ros_gazebo_devel_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services

### Generating Module File
_generate_module_cpp(ros_gazebo_devel
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ros_gazebo_devel
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(ros_gazebo_devel_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(ros_gazebo_devel_generate_messages ros_gazebo_devel_generate_messages_cpp)

# add dependencies to all check dependencies targets

# target for backward compatibility
add_custom_target(ros_gazebo_devel_gencpp)
add_dependencies(ros_gazebo_devel_gencpp ros_gazebo_devel_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ros_gazebo_devel_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services

### Generating Module File
_generate_module_eus(ros_gazebo_devel
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ros_gazebo_devel
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(ros_gazebo_devel_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(ros_gazebo_devel_generate_messages ros_gazebo_devel_generate_messages_eus)

# add dependencies to all check dependencies targets

# target for backward compatibility
add_custom_target(ros_gazebo_devel_geneus)
add_dependencies(ros_gazebo_devel_geneus ros_gazebo_devel_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ros_gazebo_devel_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services

### Generating Module File
_generate_module_lisp(ros_gazebo_devel
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ros_gazebo_devel
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(ros_gazebo_devel_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(ros_gazebo_devel_generate_messages ros_gazebo_devel_generate_messages_lisp)

# add dependencies to all check dependencies targets

# target for backward compatibility
add_custom_target(ros_gazebo_devel_genlisp)
add_dependencies(ros_gazebo_devel_genlisp ros_gazebo_devel_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ros_gazebo_devel_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services

### Generating Module File
_generate_module_nodejs(ros_gazebo_devel
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ros_gazebo_devel
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(ros_gazebo_devel_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(ros_gazebo_devel_generate_messages ros_gazebo_devel_generate_messages_nodejs)

# add dependencies to all check dependencies targets

# target for backward compatibility
add_custom_target(ros_gazebo_devel_gennodejs)
add_dependencies(ros_gazebo_devel_gennodejs ros_gazebo_devel_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ros_gazebo_devel_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services

### Generating Module File
_generate_module_py(ros_gazebo_devel
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ros_gazebo_devel
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(ros_gazebo_devel_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(ros_gazebo_devel_generate_messages ros_gazebo_devel_generate_messages_py)

# add dependencies to all check dependencies targets

# target for backward compatibility
add_custom_target(ros_gazebo_devel_genpy)
add_dependencies(ros_gazebo_devel_genpy ros_gazebo_devel_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ros_gazebo_devel_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ros_gazebo_devel)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ros_gazebo_devel
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET gazebo_msgs_generate_messages_cpp)
  add_dependencies(ros_gazebo_devel_generate_messages_cpp gazebo_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(ros_gazebo_devel_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET nav_msgs_generate_messages_cpp)
  add_dependencies(ros_gazebo_devel_generate_messages_cpp nav_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ros_gazebo_devel)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ros_gazebo_devel
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET gazebo_msgs_generate_messages_eus)
  add_dependencies(ros_gazebo_devel_generate_messages_eus gazebo_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(ros_gazebo_devel_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET nav_msgs_generate_messages_eus)
  add_dependencies(ros_gazebo_devel_generate_messages_eus nav_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ros_gazebo_devel)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ros_gazebo_devel
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET gazebo_msgs_generate_messages_lisp)
  add_dependencies(ros_gazebo_devel_generate_messages_lisp gazebo_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(ros_gazebo_devel_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET nav_msgs_generate_messages_lisp)
  add_dependencies(ros_gazebo_devel_generate_messages_lisp nav_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ros_gazebo_devel)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ros_gazebo_devel
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET gazebo_msgs_generate_messages_nodejs)
  add_dependencies(ros_gazebo_devel_generate_messages_nodejs gazebo_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(ros_gazebo_devel_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET nav_msgs_generate_messages_nodejs)
  add_dependencies(ros_gazebo_devel_generate_messages_nodejs nav_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ros_gazebo_devel)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ros_gazebo_devel\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ros_gazebo_devel
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET gazebo_msgs_generate_messages_py)
  add_dependencies(ros_gazebo_devel_generate_messages_py gazebo_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(ros_gazebo_devel_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET nav_msgs_generate_messages_py)
  add_dependencies(ros_gazebo_devel_generate_messages_py nav_msgs_generate_messages_py)
endif()
