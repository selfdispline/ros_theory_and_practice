;; Auto-generated. Do not edit!


(when (boundp 'work_03::TurtleMotionCmdMsg)
  (if (not (find-package "WORK_03"))
    (make-package "WORK_03"))
  (shadow 'TurtleMotionCmdMsg (find-package "WORK_03")))
(unless (find-package "WORK_03::TURTLEMOTIONCMDMSG")
  (make-package "WORK_03::TURTLEMOTIONCMDMSG"))

(in-package "ROS")
;;//! \htmlinclude TurtleMotionCmdMsg.msg.html


(defclass work_03::TurtleMotionCmdMsg
  :super ros::object
  :slots (_name _start_move _linear_velocity_x _angular_velocity_z ))

(defmethod work_03::TurtleMotionCmdMsg
  (:init
   (&key
    ((:name __name) "")
    ((:start_move __start_move) nil)
    ((:linear_velocity_x __linear_velocity_x) 0.0)
    ((:angular_velocity_z __angular_velocity_z) 0.0)
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _start_move __start_move)
   (setq _linear_velocity_x (float __linear_velocity_x))
   (setq _angular_velocity_z (float __angular_velocity_z))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:start_move
   (&optional __start_move)
   (if __start_move (setq _start_move __start_move)) _start_move)
  (:linear_velocity_x
   (&optional __linear_velocity_x)
   (if __linear_velocity_x (setq _linear_velocity_x __linear_velocity_x)) _linear_velocity_x)
  (:angular_velocity_z
   (&optional __angular_velocity_z)
   (if __angular_velocity_z (setq _angular_velocity_z __angular_velocity_z)) _angular_velocity_z)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; bool _start_move
    1
    ;; float32 _linear_velocity_x
    4
    ;; float32 _angular_velocity_z
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; bool _start_move
       (if _start_move (write-byte -1 s) (write-byte 0 s))
     ;; float32 _linear_velocity_x
       (sys::poke _linear_velocity_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _angular_velocity_z
       (sys::poke _angular_velocity_z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _start_move
     (setq _start_move (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float32 _linear_velocity_x
     (setq _linear_velocity_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _angular_velocity_z
     (setq _angular_velocity_z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get work_03::TurtleMotionCmdMsg :md5sum-) "0c5c8ff6294017c048dbb00bbe500e82")
(setf (get work_03::TurtleMotionCmdMsg :datatype-) "work_03/TurtleMotionCmdMsg")
(setf (get work_03::TurtleMotionCmdMsg :definition-)
      "string name
bool start_move
float32 linear_velocity_x
float32 angular_velocity_z
")



(provide :work_03/TurtleMotionCmdMsg "0c5c8ff6294017c048dbb00bbe500e82")


