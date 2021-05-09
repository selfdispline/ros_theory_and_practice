// Generated by gencpp from file learning_communication/PersonMsg.msg
// DO NOT EDIT!


#ifndef LEARNING_COMMUNICATION_MESSAGE_PERSONMSG_H
#define LEARNING_COMMUNICATION_MESSAGE_PERSONMSG_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace learning_communication
{
template <class ContainerAllocator>
struct PersonMsg_
{
  typedef PersonMsg_<ContainerAllocator> Type;

  PersonMsg_()
    : name()
    , age(0)
    , sex(0)  {
    }
  PersonMsg_(const ContainerAllocator& _alloc)
    : name(_alloc)
    , age(0)
    , sex(0)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _name_type;
  _name_type name;

   typedef uint8_t _age_type;
  _age_type age;

   typedef uint8_t _sex_type;
  _sex_type sex;



// reducing the odds to have name collisions with Windows.h 
#if defined(_WIN32) && defined(unknow)
  #undef unknow
#endif
#if defined(_WIN32) && defined(male)
  #undef male
#endif
#if defined(_WIN32) && defined(female)
  #undef female
#endif

  enum {
    unknow = 0u,
    male = 1u,
    female = 2u,
  };


  typedef boost::shared_ptr< ::learning_communication::PersonMsg_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::learning_communication::PersonMsg_<ContainerAllocator> const> ConstPtr;

}; // struct PersonMsg_

typedef ::learning_communication::PersonMsg_<std::allocator<void> > PersonMsg;

typedef boost::shared_ptr< ::learning_communication::PersonMsg > PersonMsgPtr;
typedef boost::shared_ptr< ::learning_communication::PersonMsg const> PersonMsgConstPtr;

// constants requiring out of line definition

   

   

   



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::learning_communication::PersonMsg_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::learning_communication::PersonMsg_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::learning_communication::PersonMsg_<ContainerAllocator1> & lhs, const ::learning_communication::PersonMsg_<ContainerAllocator2> & rhs)
{
  return lhs.name == rhs.name &&
    lhs.age == rhs.age &&
    lhs.sex == rhs.sex;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::learning_communication::PersonMsg_<ContainerAllocator1> & lhs, const ::learning_communication::PersonMsg_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace learning_communication

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::learning_communication::PersonMsg_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::learning_communication::PersonMsg_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::learning_communication::PersonMsg_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::learning_communication::PersonMsg_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::learning_communication::PersonMsg_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::learning_communication::PersonMsg_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::learning_communication::PersonMsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "0e420aab7dd1abc422599df9ad8d1331";
  }

  static const char* value(const ::learning_communication::PersonMsg_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x0e420aab7dd1abc4ULL;
  static const uint64_t static_value2 = 0x22599df9ad8d1331ULL;
};

template<class ContainerAllocator>
struct DataType< ::learning_communication::PersonMsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "learning_communication/PersonMsg";
  }

  static const char* value(const ::learning_communication::PersonMsg_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::learning_communication::PersonMsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string name\n"
"uint8 age\n"
"uint8 sex\n"
"\n"
"uint8 unknow = 0\n"
"uint8 male =1\n"
"uint8 female = 2\n"
;
  }

  static const char* value(const ::learning_communication::PersonMsg_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::learning_communication::PersonMsg_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.name);
      stream.next(m.age);
      stream.next(m.sex);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct PersonMsg_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::learning_communication::PersonMsg_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::learning_communication::PersonMsg_<ContainerAllocator>& v)
  {
    s << indent << "name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.name);
    s << indent << "age: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.age);
    s << indent << "sex: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.sex);
  }
};

} // namespace message_operations
} // namespace ros

#endif // LEARNING_COMMUNICATION_MESSAGE_PERSONMSG_H
