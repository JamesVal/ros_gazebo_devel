#include "ros/ros.h"
#include "gazebo_msgs/GetModelState.h"
#include "gazebo_msgs/SetModelState.h"
#include "geometry_msgs/Twist.h"
#include "tf/tf.h"

gazebo_msgs::GetModelState srv;
gazebo_msgs::SetModelState new_state_srv;
static int gotCmdVel = 0;
ros::ServiceClient getClient;
ros::ServiceClient setClient;

void cmdVelCallback(const geometry_msgs::Twist::ConstPtr& msg)
{
  gotCmdVel = 1;
  ROS_INFO("gazebo: Get Current state success");
  new_state_srv.request.model_state.model_name = "robot";
  new_state_srv.request.model_state.pose.position.x = 0;
  new_state_srv.request.model_state.pose.position.y = 0;
  new_state_srv.request.model_state.pose.position.z = 0;
  new_state_srv.request.model_state.pose.orientation.x = 0;
  new_state_srv.request.model_state.pose.orientation.y = 0;
  new_state_srv.request.model_state.pose.orientation.z = 0;
  new_state_srv.request.model_state.pose.orientation.w = 1;
  new_state_srv.request.model_state.twist.linear.x = msg->linear.x;
  new_state_srv.request.model_state.twist.angular = msg->angular;
  new_state_srv.request.model_state.reference_frame = "robot";
  if (setClient.call(new_state_srv)) {
    ROS_INFO("gazebo: vel (%.2f,%.2f)", msg->linear.x, msg->angular.z);
    ROS_INFO("gazebo: Set Current state success");
  } else { 
    ROS_INFO("gazebo: Set Current state FAILED");
  }
}

int main(int argc, char** argv)
{
  ros::init(argc, argv, "gazebo_cmd_vel");

  ros::NodeHandle n;
  getClient = n.serviceClient<gazebo_msgs::GetModelState>("gazebo/get_model_state");
  setClient = n.serviceClient<gazebo_msgs::SetModelState>("gazebo/set_model_state");
  ros::Subscriber sub = n.subscribe("/cmd_vel", 1000, cmdVelCallback);

  ros::spin();
  return 0;
}
