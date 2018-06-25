#include "ros/ros.h"
#include "tf/transform_broadcaster.h"
#include "nav_msgs/Odometry.h"
#include "geometry_msgs/Quaternion.h"
#include "gazebo_msgs/ModelStates.h"

ros::Publisher odom_pub;

void poseCallback(const gazebo_msgs::ModelStates::ConstPtr& msg)
{
  static tf::TransformBroadcaster odom_broadcaster;

  geometry_msgs::Quaternion odom_quat_msg = msg->pose[1].orientation;

  odom_broadcaster.sendTransform(tf::StampedTransform(tf::Transform(tf::Quaternion(odom_quat_msg.x, odom_quat_msg.y, odom_quat_msg.z, odom_quat_msg.w), tf::Vector3(msg->pose[1].position.x, msg->pose[1].position.y, 0)), ros::Time::now(), "odom", "base_link"));

  nav_msgs::Odometry odom;
  odom.header.stamp = ros::Time::now();
  odom.header.frame_id = "odom";

  odom.pose.pose.position.x = msg->pose[1].position.x;
  odom.pose.pose.position.y = msg->pose[1].position.y;
  odom.pose.pose.position.z = 0.0;
  odom.pose.pose.orientation = odom_quat_msg;

  //set the velocity
  odom.child_frame_id = "base_link";
  odom.twist.twist.linear.x = msg->twist[1].linear.x;
  odom.twist.twist.linear.y = msg->twist[1].linear.y;
  odom.twist.twist.angular.z = msg->twist[1].angular.z;

  //publish the message
  odom_pub.publish(odom);
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "gazebopose_to_odom");
  ros::NodeHandle n;
  ros::Subscriber sub = n.subscribe("gazebo/model_states", 1000, poseCallback);
  odom_pub = n.advertise<nav_msgs::Odometry>("odom", 1000);
  ROS_INFO("GazeboPose Running");
  ros::spin();

  return 0;
}

