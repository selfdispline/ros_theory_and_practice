; Auto-generated. Do not edit!


(cl:in-package work_03-msg)


;//! \htmlinclude TurtleNameMsg.msg.html

(cl:defclass <TurtleNameMsg> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform ""))
)

(cl:defclass TurtleNameMsg (<TurtleNameMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TurtleNameMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TurtleNameMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name work_03-msg:<TurtleNameMsg> is deprecated: use work_03-msg:TurtleNameMsg instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <TurtleNameMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader work_03-msg:name-val is deprecated.  Use work_03-msg:name instead.")
  (name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TurtleNameMsg>) ostream)
  "Serializes a message object of type '<TurtleNameMsg>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TurtleNameMsg>) istream)
  "Deserializes a message object of type '<TurtleNameMsg>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TurtleNameMsg>)))
  "Returns string type for a message object of type '<TurtleNameMsg>"
  "work_03/TurtleNameMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TurtleNameMsg)))
  "Returns string type for a message object of type 'TurtleNameMsg"
  "work_03/TurtleNameMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TurtleNameMsg>)))
  "Returns md5sum for a message object of type '<TurtleNameMsg>"
  "c1f3d28f1b044c871e6eff2e9fc3c667")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TurtleNameMsg)))
  "Returns md5sum for a message object of type 'TurtleNameMsg"
  "c1f3d28f1b044c871e6eff2e9fc3c667")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TurtleNameMsg>)))
  "Returns full string definition for message of type '<TurtleNameMsg>"
  (cl:format cl:nil "string name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TurtleNameMsg)))
  "Returns full string definition for message of type 'TurtleNameMsg"
  (cl:format cl:nil "string name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TurtleNameMsg>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TurtleNameMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'TurtleNameMsg
    (cl:cons ':name (name msg))
))
