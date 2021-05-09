;; Auto-generated. Do not edit!


(when (boundp 'work_03::TurtleNameMsg)
  (if (not (find-package "WORK_03"))
    (make-package "WORK_03"))
  (shadow 'TurtleNameMsg (find-package "WORK_03")))
(unless (find-package "WORK_03::TURTLENAMEMSG")
  (make-package "WORK_03::TURTLENAMEMSG"))

(in-package "ROS")
;;//! \htmlinclude TurtleNameMsg.msg.html


(defclass work_03::TurtleNameMsg
  :super ros::object
  :slots (_name ))

(defmethod work_03::TurtleNameMsg
  (:init
   (&key
    ((:name __name) "")
    )
   (send-super :init)
   (setq _name (string __name))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get work_03::TurtleNameMsg :md5sum-) "c1f3d28f1b044c871e6eff2e9fc3c667")
(setf (get work_03::TurtleNameMsg :datatype-) "work_03/TurtleNameMsg")
(setf (get work_03::TurtleNameMsg :definition-)
      "string name

")



(provide :work_03/TurtleNameMsg "c1f3d28f1b044c871e6eff2e9fc3c667")


