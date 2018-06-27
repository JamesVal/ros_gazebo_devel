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
}

int main(int argc, char** argv)
{
  enum GAZEBO_STATE {
    CHECK_FOR_COMMAND,
    GET_CURRENT_MODEL_STATE,
    SET_CURRENT_MODEL_STATE,
    RESET_MODEL,
    DEFAULT_STATE
  };

  GAZEBO_STATE curState = DEFAULT_STATE;

  ros::Time curTime, lastTime;

  ros::init(argc, argv, "gazebo_cmd_vel");

  ros::NodeHandle n;
  getClient = n.serviceClient<gazebo_msgs::GetModelState>("gazebo/get_model_state");
  setClient = n.serviceClient<gazebo_msgs::SetModelState>("gazebo/set_model_state");
  ros::Subscriber sub = n.subscribe("/cmd_vel", 1000, cmdVelCallback);
  srv.request.model_name = "robot";
  srv.request.relative_entity_name = "";

  curTime = ros::Time::now();
  lastTime = ros::Time::now();

  ros::Rate r(10);

  while (n.ok())  {
    curTime = ros::Time::now(); 
    switch (curState) {
      case CHECK_FOR_COMMAND:
        if (gotCmdVel) {
          ROS_INFO("gazebo: got cmd_vel");
          lastTime = ros::Time::now();
          curState = DEFAULT_STATE;
        } else if ((curTime.toSec() - lastTime.toSec()) > 1) {
          curState = RESET_MODEL;
        }
        break;
      case RESET_MODEL:
      {
        geometry_msgs::Twist stopTwist;
        stopTwist.linear.x = 0;
        stopTwist.linear.y = 0;
        stopTwist.linear.z = 0;
        stopTwist.angular.x = 0;
        stopTwist.angular.y = 0;
        stopTwist.angular.z = 0;
        new_state_srv.request.model_state.model_name = "robot";
        new_state_srv.request.model_state.pose.position.x = 0;
        new_state_srv.request.model_state.pose.position.y = 0;
        new_state_srv.request.model_state.pose.position.z = 0;
        new_state_srv.request.model_state.pose.orientation.x = 0;
        new_state_srv.request.model_state.pose.orientation.y = 0;
        new_state_srv.request.model_state.pose.orientation.z = 0;
        new_state_srv.request.model_state.pose.orientation.w = 1;
        new_state_srv.request.model_state.twist = stopTwist;
        new_state_srv.request.model_state.reference_frame = "robot";

        if (setClient.call(new_state_srv)) {
          ROS_INFO("gazebo: reset success");
        } else { 
          ROS_INFO("gazebo: reset FAILED");
        }

        lastTime = ros::Time::now();
        curState = DEFAULT_STATE;
        break;
      }
      case DEFAULT_STATE:
        gotCmdVel = 0;
        lastTime = ros::Time::now();
        curState = CHECK_FOR_COMMAND;
        break;
    }
    ros::spinOnce();
    r.sleep();
  }
  return 0;
}
