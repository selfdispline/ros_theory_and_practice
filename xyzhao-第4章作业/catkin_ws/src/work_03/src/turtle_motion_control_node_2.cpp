#include <ros/ros.h>
#include <iostream>
#include <work_03/TurtleMotionCmdMsg.h>
#include <geometry_msgs/Twist.h>
#include <string.h>

#define MAX_TURTLE_NUMBER 10  //最大控制海龟数量



typedef struct
{
    std::string name;
    float linear_v_x;
    float angular_v_z;
}turtle_motion_member;

class TURTLE_MOTION_CONTROL
{
public:
   
    ros::Publisher pub[MAX_TURTLE_NUMBER];  //publisher线性表
    turtle_motion_member turtle_member[MAX_TURTLE_NUMBER];  //存放publisher所需的海龟信息，名字、x方向速度、z方向角速度
    int pub_length;   //publisher线性表长度

    ros::NodeHandle nh;
    void add_pub(turtle_motion_member new_member);
    void reduce_pub(int position2reduce);
    void modify_pub(int position2modif,turtle_motion_member new_member);
    int find_pub(std::string name2find);
    void pub_once(void);

};
 

//该函数用于增加一个publisher
void TURTLE_MOTION_CONTROL::add_pub(turtle_motion_member new_member)
{
    if(this->pub_length>=MAX_TURTLE_NUMBER)
    {
        ROS_ERROR("Exceed the max number of turtles!!!");
    }
    else
    {
        std::string topic_name;
        topic_name=new_member.name+"/cmd_vel";
        this->pub[this->pub_length]=this->nh.advertise<geometry_msgs::Twist>(topic_name,10);
        this->turtle_member[this->pub_length].name=new_member.name;
        this->turtle_member[this->pub_length].linear_v_x=new_member.linear_v_x;
        this->turtle_member[this->pub_length].angular_v_z=new_member.angular_v_z;
        this->pub_length++;     
                
    }
}

//该函数用于除去指定位置的pub,并后面的成员全部前移
void TURTLE_MOTION_CONTROL::reduce_pub(int position2reduce)
{
    for(int i=position2reduce;i<pub_length-1;i++)
    {
        this->pub[i]=pub[i+1];
        this->turtle_member[i].name=this->turtle_member[i+1].name;
        this->turtle_member[i].linear_v_x=this->turtle_member[i+1].linear_v_x;
        this->turtle_member[i].angular_v_z=this->turtle_member[i+1].angular_v_z;

    }
    this->pub_length--;
}




//该函数用于更改发布的消息内容
void TURTLE_MOTION_CONTROL::modify_pub(int position2modif,turtle_motion_member new_member)
{
    this->turtle_member[position2modif].linear_v_x=new_member.linear_v_x;
    this->turtle_member[position2modif].angular_v_z=new_member.angular_v_z;
}

//返回对应名字在数组中的位置,没有找到返回-1
int TURTLE_MOTION_CONTROL::find_pub(std::string name2find)
{
    for(int i=0;i<this->pub_length;i++)
    {
        if(this->turtle_member[i].name==name2find)
        {
            return i;

        }
    }
    return -1;
}

//将所有的pub发布一次
void TURTLE_MOTION_CONTROL::pub_once(void)
{
    for(int i=0;i<this->pub_length;i++)
    {
        geometry_msgs::Twist turtle_vel_msg;
        turtle_vel_msg.linear.x=this->turtle_member[i].linear_v_x;
        turtle_vel_msg.angular.z=this->turtle_member[i].angular_v_z;

        //发布
        ROS_INFO("Publish [%s] velocity:  x:%0.2f m/s  z:%0.2f rad/s",
        this->turtle_member[i].name.c_str(),turtle_vel_msg.linear.x,turtle_vel_msg.angular.z);
        this->pub[i].publish(turtle_vel_msg);
       

    }
}

void TurtleMotionCmdCallback(const work_03::TurtleMotionCmdMsg::ConstPtr msg,TURTLE_MOTION_CONTROL* turtle_control)
{
    ROS_INFO("Subcribe turtle_motion_cmd: name: %s  status: %s  linear_velocity_x: %0.2f  angular_velocity_z:%0.2f ",
    msg->name.c_str(),msg->start_move?"move":"stop",msg->linear_velocity_x,msg->angular_velocity_z);
    int member_position=turtle_control->find_pub(msg->name.c_str());
    turtle_motion_member new_member;
    new_member.name=msg->name;
    new_member.angular_v_z=msg->angular_velocity_z;
    new_member.linear_v_x=msg->linear_velocity_x;

    if(msg->start_move==true&&member_position==-1)
    {
        
        turtle_control->add_pub(new_member);
    }
    else if(member_position!=-1&&msg->start_move==0)
    {
        turtle_control->reduce_pub(member_position);
    }
    else if(member_position!=-1&&msg->start_move==1)
    {        
        turtle_control->modify_pub(member_position,new_member);

    }

}


int main(int argc,char** argv)
{
   
    //初始化ROS节点
    ros::init(argc,argv, "turtle_motion_control_node_2");
    
    TURTLE_MOTION_CONTROL* turtle_control=new TURTLE_MOTION_CONTROL();
    turtle_control->pub_length=0;             

    //创建一个subscriber,订阅/turtle_motion_cmd话题
    ros::Subscriber TurtleName_sub=turtle_control->nh.subscribe<work_03::TurtleMotionCmdMsg>("turtle_motion_cmd", 10, boost::bind(&TurtleMotionCmdCallback, _1, turtle_control));

    //设置循环频率
    ros::Rate loop_rate(10);


    while(ros::ok())
    {
        ros::spinOnce();
        
        turtle_control->pub_once();
    
        loop_rate.sleep();
    }

    return 0;
}

