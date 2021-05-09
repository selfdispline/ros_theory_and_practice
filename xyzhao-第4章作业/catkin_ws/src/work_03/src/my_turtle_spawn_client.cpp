//请求spawn服务，服务类型为turtlesim/Spawn
#include "ros/ros.h"
#include "turtlesim/Spawn.h"

int main(int argc,char **argv)
{
    //初始化ROS节点
    ros::init(argc,argv,"my_turtle_spawn_client");

    //创建节点句柄
    ros::NodeHandle n;

    //创建一个Client,service消息类型为turtlesim::Spawn
    ros::ServiceClient client=n.serviceClient<turtlesim::Spawn>("spawn");

    //创建turtlesim::Spawn类型的service消息
    turtlesim::Spawn turtle_spawn_srv;
    turtle_spawn_srv.request.x=2;
    turtle_spawn_srv.request.y=3;
    turtle_spawn_srv.request.theta=0;
    turtle_spawn_srv.request.name="my_turtle";
    ros::Duration(0.5).sleep();
    //发布service请求，等待应答结果
    if(client.call(turtle_spawn_srv))
    {
        ROS_INFO("Response : spawn a turtle  x: %0.2f  y: %0.2f  theta: %0.2f  name: %s",
        turtle_spawn_srv.request.x,turtle_spawn_srv.request.y,turtle_spawn_srv.request.theta,turtle_spawn_srv.request.name.c_str());  
        
    }
    else
    {
        ROS_ERROR("Failed to call service spawn");
        return 1;
    }



}