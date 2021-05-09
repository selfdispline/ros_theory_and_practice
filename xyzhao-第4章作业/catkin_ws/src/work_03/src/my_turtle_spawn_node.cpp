//订阅话题/TurtleName,并根据内容请求spawn服务
#include "ros/ros.h"
#include "turtlesim/Spawn.h"
#include "work_03/TurtleNameMsg.h"

//计数用于计算新海龟位置
int count=0;

void TurtleNameCallback(const work_03::TurtleNameMsg::ConstPtr& msg)
{
    // 将接收到的消息打印出来
    ROS_INFO("Subcribe TurtleName: name:%s",msg->name.c_str());

    //创建节点句柄
    ros::NodeHandle a;

    //创建一个Client,service消息类型为turtlesim::Spawn
    ros::ServiceClient client=a.serviceClient<turtlesim::Spawn>("spawn");

    //创建turtlesim::Spawn类型的service消息
    turtlesim::Spawn turtle_spawn_srv;
    turtle_spawn_srv.request.x=2+count;
    turtle_spawn_srv.request.y=2+count;
    turtle_spawn_srv.request.theta=0;
    turtle_spawn_srv.request.name=msg->name;

    //发布service请求，等待应答结果
    if(client.call(turtle_spawn_srv))
    {
        ROS_INFO("Response : spawn a turtle  x: %0.2f  y: %0.2f  theta: %0.2f  name: %s",
        turtle_spawn_srv.request.x,turtle_spawn_srv.request.y,turtle_spawn_srv.request.theta,turtle_spawn_srv.request.name.c_str());  
        
    }
    else
    {
        ROS_ERROR("Failed to call service spawn");        
    }

    count++;
			 
}

int main(int argc,char **argv)
{
    //初始化ROS节点
    ros::init(argc,argv,"my_turtle_spawn_node");

    //创建节点句柄
    ros::NodeHandle n;
    
    //创建一个subscriber,订阅话题为/TurtleName,消息类型为work_03/TurtleNameMsg
    ros::Subscriber TurtleName_sub=n.subscribe("/TurtleName",10,TurtleNameCallback);
    

    // 循环等待回调函数
    ros::spin();

    return 0;


}