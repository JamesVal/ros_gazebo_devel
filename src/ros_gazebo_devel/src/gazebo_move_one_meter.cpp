#include "ros/ros.h"
#include "gazebo_msgs/GetModelState.h"
#include "gazebo_msgs/SetModelState.h"
#include "geometry_msgs/Twist.h"

gazebo_msgs::GetModelState srv;
gazebo_msgs::SetModelState new_state_srv;
static int gotCmdVel = 0;
geometry_msgs::Twist lastMsg;

void cmdVelCallback(const geometry_msgs::Twist::ConstPtr& msg)
{
  gotCmdVel = 1;
  lastMsg = *msg;
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
  ros::ServiceClient getClient = n.serviceClient<gazebo_msgs::GetModelState>("gazebo/get_model_state");
  ros::ServiceClient setClient = n.serviceClient<gazebo_msgs::SetModelState>("gazebo/set_model_state");
  ros::Subscriber sub = n.subscribe("/cmd_vel", 1000, cmdVelCallback);
  srv.request.model_name = "robot";
  srv.request.relative_entity_name = "";

  ros::Rate r(10); // 10 hz

  curTime = ros::Time::now();
  lastTime = ros::Time::now();

  while (n.ok())  {
    ROS_INFO("gazebo: state %d", curState);
    curTime = ros::Time::now(); 
    switch (curState) {
      case CHECK_FOR_COMMAND:
        r.sleep();
        if (gotCmdVel) {
          ROS_INFO("gazebo: got cmd_vel");
          lastTime = ros::Time::now();
          curState = GET_CURRENT_MODEL_STATE;
        } else if ((curTime.toSec() - lastTime.toSec()) > 1) {
          curState = GET_CURRENT_MODEL_STATE;
        }
        break;
      case GET_CURRENT_MODEL_STATE:
        if (getClient.call(srv)) {
          ROS_INFO("gazebo: Get Current state success");
          if (gotCmdVel) {
            new_state_srv.request.model_state.model_name = "robot";
            new_state_srv.request.model_state.pose = srv.response.pose;
            new_state_srv.request.model_state.twist = lastMsg;
            new_state_srv.request.model_state.reference_frame = "";
            curState = SET_CURRENT_MODEL_STATE;
          } else {
            curState = RESET_MODEL;
          }
          lastTime = ros::Time::now();
        } else {
          ROS_INFO("gazebo: Get Current state FAILED");
          curState =  DEFAULT_STATE;
        }
        break;
      case SET_CURRENT_MODEL_STATE:
        if (setClient.call(new_state_srv)) {
          ROS_INFO("gazebo: Set Current state success");
          lastTime = ros::Time::now();
          curState = DEFAULT_STATE;
        } else { 
          ROS_INFO("gazebo: Set Current state FAILED");
          curState = DEFAULT_STATE;
        }
        break;
      case RESET_MODEL:
      {
        geometry_msgs::Twist stopTwist;

        ROS_INFO("gazebo: reset");
        stopTwist.linear.x = 0;
        stopTwist.linear.y = 0;
        stopTwist.linear.z = 0;
        stopTwist.angular.x = 0;
        stopTwist.angular.y = 0;
        stopTwist.angular.z = 0;
        new_state_srv.request.model_state.model_name = "robot";
        new_state_srv.request.model_state.pose = srv.response.pose;
        new_state_srv.request.model_state.twist = stopTwist;
        new_state_srv.request.model_state.reference_frame = "";

        if (setClient.call(new_state_srv)) {
          ROS_INFO("gazebo: Set reset state success");
        } else { 
          ROS_INFO("gazebo: Set reset state FAILED");
        }
        lastTime = ros::Time::now();
        curState = DEFAULT_STATE;
        break;
      }
      case DEFAULT_STATE:
        r.sleep();
        gotCmdVel = 0;
        lastTime = ros::Time::now();
        curState = CHECK_FOR_COMMAND;
        break;
    }
/*
    curTime = ros::Time::now(); 
    if (gotCmdVel)
    {
      lastTime = ros::Time::now();
      ROS_INFO("Got cmd_vel");
      if (getClient.call(srv))
      {
        ROS_INFO("Get Current state success");
        gotCmdVel = 0;
      }
      else
      {
        ROS_ERROR("Failed to call service: get_model_state");
        lastTime = ros::Time::now();
      }
    } else if ((curTime.toSec() - lastTime.toSec()) > 5) {
      ROS_INFO("Reset");
      lastTime = ros::Time::now();
    }
*/
    ros::spinOnce();
  }
  return 0;
}
