
(cl:in-package :asdf)

(defsystem "work_03-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "TurtleMotionCmdMsg" :depends-on ("_package_TurtleMotionCmdMsg"))
    (:file "_package_TurtleMotionCmdMsg" :depends-on ("_package"))
    (:file "TurtleNameMsg" :depends-on ("_package_TurtleNameMsg"))
    (:file "_package_TurtleNameMsg" :depends-on ("_package"))
  ))