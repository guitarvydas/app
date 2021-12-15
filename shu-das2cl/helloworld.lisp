
;;;;;;; Component hello

(defclass hello (leaf) ())
(defmethod initialize ((self hello) (in message-queue) (out message-queue) (dispatcher Dispatcher))
  (call-next-method))
(defmethod react ((self hello) (m message))
  (declare (ignore m))
  (format *standard-output* "hello~%")
  (send self t))
  

;;;;;;; Component world

(defclass world (leaf) ())
(defmethod initialize ((self world) (in message-queue) (out message-queue) (dispatcher Dispatcher))
  (call-next-method))
(defmethod react ((self world) (m message))
  (declare (ignore m))
  (format *standard-output* "world~%"))


;;;;;;; Component helloworld

(defclass helloworld (container) ())
(defmethod initialize ((self helloworld) (in message-queue) (out message-queue) (dispatcher Dispatcher))    
  (let ((conn0 (make-instance 'connector))
    (let ((hello (make-instance 'hello :output-queue conn0 :parent self))
	  (world (make-instance 'world :input-queue conn0 :parent self))
      (setf (children self) (make-instance 'dict :map '("hello" hello "world" world)))
      (setf (both-ends conn0) "hello" "world")
      (call-next-method))))


;;;;;;;; top level

(defun top ()
  (let ((dispatcher (make-instance 'Dispatcher))
	(helloworld (make-instance 'helloworld)))
    (initialize helloworld nil nil dispatcher)
    (kickstart helloworld)
    (dispatcher dispatch)))


