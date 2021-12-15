(defclass connection () 
  ((queue :accessor queue :initform (make-instance 'message-queue))
   (sender :accessor sender :initform nil)
   (receiver :accessor receiver :initform nil)))