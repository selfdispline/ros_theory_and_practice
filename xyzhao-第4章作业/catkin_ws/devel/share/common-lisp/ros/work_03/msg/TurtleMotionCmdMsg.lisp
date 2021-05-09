; Auto-generated. Do not edit!


(cl:in-package work_03-msg)


;//! \htmlinclude TurtleMotionCmdMsg.msg.html

(cl:defclass <TurtleMotionCmdMsg> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (start_move
    :reader start_move
    :initarg :start_move
    :type cl:boolean
    :initform cl:nil)
   (linear_velocity_x
    :reader linear_velocity_x
    :initarg :linear_velocity_x
    :type cl:float
    :initform 0.0)
   (angular_velocity_z
    :reader angular_velocity_z
    :initarg :angular_velocity_z
    :type cl:float
    :initform 0.0))
)

(cl:defclass TurtleMotionCmdMsg (<TurtleMotionCmdMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TurtleMotionCmdMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TurtleMotionCmdMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name work_03-msg:<TurtleMotionCmdMsg> is deprecated: use work_03-msg:TurtleMotionCmdMsg instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <TurtleMotionCmdMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader work_03-msg:name-val is deprecated.  Use work_03-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'start_move-val :lambda-list '(m))
(cl:defmethod start_move-val ((m <TurtleMotionCmdMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader work_03-msg:start_move-val is deprecated.  Use work_03-msg:start_move instead.")
  (start_move m))

(cl:ensure-generic-function 'linear_velocity_x-val :lambda-list '(m))
(cl:defmethod linear_velocity_x-val ((m <TurtleMotionCmdMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader work_03-msg:linear_velocity_x-val is deprecated.  Use work_03-msg:linear_velocity_x instead.")
  (linear_velocity_x m))

(cl:ensure-generic-function 'angular_velocity_z-val :lambda-list '(m))
(cl:defmethod angular_velocity_z-val ((m <TurtleMotionCmdMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader work_03-msg:angular_velocity_z-val is deprecated.  Use work_03-msg:angular_velocity_z instead.")
  (angular_velocity_z m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TurtleMotionCmdMsg>) ostream)
  "Serializes a message object of type '<TurtleMotionCmdMsg>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'start_move) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'linear_velocity_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angular_velocity_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TurtleMotionCmdMsg>) istream)
  "Deserializes a message object of type '<TurtleMotionCmdMsg>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'start_move) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'linear_velocity_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angular_velocity_z) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TurtleMotionCmdMsg>)))
  "Returns string type for a message object of type '<TurtleMotionCmdMsg>"
  "work_03/TurtleMotionCmdMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TurtleMotionCmdMsg)))
  "Returns string type for a message object of type 'TurtleMotionCmdMsg"
  "work_03/TurtleMotionCmdMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TurtleMotionCmdMsg>)))
  "Returns md5sum for a message object of type '<TurtleMotionCmdMsg>"
  "0c5c8ff6294017c048dbb00bbe500e82")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TurtleMotionCmdMsg)))
  "Returns md5sum for a message object of type 'TurtleMotionCmdMsg"
  "0c5c8ff6294017c048dbb00bbe500e82")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TurtleMotionCmdMsg>)))
  "Returns full string definition for message of type '<TurtleMotionCmdMsg>"
  (cl:format cl:nil "string name~%bool start_move~%float32 linear_velocity_x~%float32 angular_velocity_z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TurtleMotionCmdMsg)))
  "Returns full string definition for message of type 'TurtleMotionCmdMsg"
  (cl:format cl:nil "string name~%bool start_move~%float32 linear_velocity_x~%float32 angular_velocity_z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TurtleMotionCmdMsg>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     1
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TurtleMotionCmdMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'TurtleMotionCmdMsg
    (cl:cons ':name (name msg))
    (cl:cons ':start_move (start_move msg))
    (cl:cons ':linear_velocity_x (linear_velocity_x msg))
    (cl:cons ':angular_velocity_z (angular_velocity_z msg))
))
