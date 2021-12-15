(defclass connector () 
  ((sender :accessor sender :initform nil)
   (receiver :accessor receiver :initform nil)))

(defmethod both-ends ((self connector) (sender STRING) (receiver STRING))
  (setf (sender self) sender)
  (setf (receiver self) receiver))