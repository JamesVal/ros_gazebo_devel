#include <ros/ros.h>
#include <tf/transform_broadcaster.h>

int main(int argc, char** argv){
  ros::init(argc, argv, "map_tf_publisher");
  ros::NodeHandle n;

  tf::TransformBroadcaster broadcaster;
  ros::Rate r(10);

  while(n.ok()){
    broadcaster.sendTransform(tf::StampedTransform(tf::Transform(tf::Quaternion(0, 0, 0, 1), tf::Vector3(1.5, 1.5, 0)), ros::Time::now(), "map", "odom"));
    r.sleep();
    //ros::spinOnce();
  }
}
