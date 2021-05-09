//发布turtle1/cmd_vel话题，消息类型为geometry_msgs::Twist,同时订阅turtle1/pose话题，消息类型为turtlesim::Pose,在终端周期输出
#include <ros/ros.h>
#include <geometry_msgs/Twist.h>
#include "std_msgs/String.h"
#include "turtlesim/Pose.h"

void turtle_pose_callback(const turtlesim::Pose::ConstPtr& turtle_pose)
{
    
    //将接收到的消息打印出来
    ROS_INFO("turtle's position now is: \n x: %0.2f m \n y: %0.2f m \n theta: %0.2f rad",turtle_pose->x,turtle_pose->y,turtle_pose->theta); 
        
}


int main(int argc,char **argv)
{
    //初始化ROS节点
    ros::init(argc,argv,"turtle_pose_subscriber_vel_publisher");

    //创建节点句柄
    ros::NodeHandle n;
       
    //创建一个publisher,发布turtle1/cmd_vel话题，消息类型为geometry_msgs::Twist
    ros::Publisher turtle_vel_pub=n.advertise<geometry_msgs::Twist>("turtle1/cmd_vel",10);

    //创建一个Subscriber,订阅turtle1/pose话题，消息类型为turtlesim::Pose
    ros::Subscriber turtle_pose_sub=n.subscribe("turtle1/pose",100,turtle_pose_callback);

    //设置循环频率
    ros::Rate loop_rate(10);

    //初始化消息
    geometry_msgs::Twist turtle_vel_msg;
    turtle_vel_msg.linear.x=1.0;
    turtle_vel_msg.angular.z=0.5;

    while(ros::ok())
    {      
        ros::spinOnce();

        //发布消息
        turtle_vel_pub.publish(turtle_vel_msg);       

        //循环延时
        loop_rate.sleep();
    }

    return 0;
}