#include "ros/ros.h"
#include "tf/transform_listener.h"
#include "sensor_msgs/LaserScan.h"
#include "sensor_msgs/PointCloud.h"
#include "laser_geometry/laser_geometry.h"

laser_geometry::LaserProjection projector;
ros::Publisher cloud_pub;

void laserCallback(const sensor_msgs::LaserScan::ConstPtr& msg)
{
  static tf::TransformListener listener;

  sensor_msgs::PointCloud cloud;

  try {
    ros::Time now = ros::Time::now();
    listener.waitForTransform("odom", "laser_sensor", now, ros::Duration(10.0));
    projector.transformLaserScanToPointCloud("odom",*msg, cloud,listener);
  } catch (tf::TransformException ex) {
    ROS_INFO("L2PC: No transform");
  }

  cloud_pub.publish(cloud);
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "laser_to_pointcloud");
  ros::NodeHandle n;
  ros::Subscriber sub = n.subscribe("scan_filtered", 1000, laserCallback);
  cloud_pub = n.advertise<sensor_msgs::PointCloud>("scan_cloud", 1000);
  ROS_INFO("Laser To PointCloud running");
  ros::spin();
  return 0;
}

