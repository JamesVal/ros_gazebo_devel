#include <ros/ros.h>
#include <tf/transform_broadcaster.h>

int main(int argc, char** argv){
  ros::init(argc, argv, "laser_tf_publisher");
  ros::NodeHandle n;

  tf::TransformBroadcaster broadcaster;
  //ros::Rate r(10);

  while(n.ok()){
    broadcaster.sendTransform(tf::StampedTransform(tf::Transform(tf::Quaternion(0, 0, 0, 1), tf::Vector3(0.4, 0, 0.8)), ros::Time::now(), "base_link", "base_laser"));
    //r.sleep();
    ros::spinOnce();
  }
}
