// Auto-generated. Do not edit!

// (in-package work_03.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class TurtleMotionCmdMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.name = null;
      this.start_move = null;
      this.linear_velocity_x = null;
      this.angular_velocity_z = null;
    }
    else {
      if (initObj.hasOwnProperty('name')) {
        this.name = initObj.name
      }
      else {
        this.name = '';
      }
      if (initObj.hasOwnProperty('start_move')) {
        this.start_move = initObj.start_move
      }
      else {
        this.start_move = false;
      }
      if (initObj.hasOwnProperty('linear_velocity_x')) {
        this.linear_velocity_x = initObj.linear_velocity_x
      }
      else {
        this.linear_velocity_x = 0.0;
      }
      if (initObj.hasOwnProperty('angular_velocity_z')) {
        this.angular_velocity_z = initObj.angular_velocity_z
      }
      else {
        this.angular_velocity_z = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TurtleMotionCmdMsg
    // Serialize message field [name]
    bufferOffset = _serializer.string(obj.name, buffer, bufferOffset);
    // Serialize message field [start_move]
    bufferOffset = _serializer.bool(obj.start_move, buffer, bufferOffset);
    // Serialize message field [linear_velocity_x]
    bufferOffset = _serializer.float32(obj.linear_velocity_x, buffer, bufferOffset);
    // Serialize message field [angular_velocity_z]
    bufferOffset = _serializer.float32(obj.angular_velocity_z, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TurtleMotionCmdMsg
    let len;
    let data = new TurtleMotionCmdMsg(null);
    // Deserialize message field [name]
    data.name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [start_move]
    data.start_move = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [linear_velocity_x]
    data.linear_velocity_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [angular_velocity_z]
    data.angular_velocity_z = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.name.length;
    return length + 13;
  }

  static datatype() {
    // Returns string type for a message object
    return 'work_03/TurtleMotionCmdMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0c5c8ff6294017c048dbb00bbe500e82';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string name
    bool start_move
    float32 linear_velocity_x
    float32 angular_velocity_z
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TurtleMotionCmdMsg(null);
    if (msg.name !== undefined) {
      resolved.name = msg.name;
    }
    else {
      resolved.name = ''
    }

    if (msg.start_move !== undefined) {
      resolved.start_move = msg.start_move;
    }
    else {
      resolved.start_move = false
    }

    if (msg.linear_velocity_x !== undefined) {
      resolved.linear_velocity_x = msg.linear_velocity_x;
    }
    else {
      resolved.linear_velocity_x = 0.0
    }

    if (msg.angular_velocity_z !== undefined) {
      resolved.angular_velocity_z = msg.angular_velocity_z;
    }
    else {
      resolved.angular_velocity_z = 0.0
    }

    return resolved;
    }
};

module.exports = TurtleMotionCmdMsg;
