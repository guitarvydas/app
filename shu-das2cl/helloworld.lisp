(in-package :mpos)

;;;;;;; Component hello

(defclass hello (leaf) ())
(defmethod initialize ((self hello) (dispatcher Dispatcher))
  (call-next-method))
(defmethod react ((self hello) (m Input-Message))
  (declare (ignore m))
  (format *standard-output* "hello~%")
  (send self "out" t))
  

;;;;;;; Component world

(defclass world (leaf) ())
(defmethod initialize ((self world) (dispatcher Dispatcher))
  (call-next-method))
(defmethod react ((self world) (m Input-Message))
  (declare (ignore m))
  (format *standard-output* "world~%"))


;;;;;;; Component helloworld

(defclass helloworld (Container) ())
(defmethod initialize ((self helloworld) (dispatcher Dispatcher))    
  (let ((conn0 (make-instance 'Connector :sender "hello" :receivers '("world"))))
    (let ((hello (make-component 'hello self dispatcher))
	  (world (make-component 'world self dispatcher)))
      (setf (connections self) (list conn0))
      (set-children self (make-dict (list "hello" hello "world" world)))
      (register-component dispatcher self)
      (call-next-method))))

(defmethod react ((self HelloWorld) (message Input-Message))
  (propagate-input-to-children self message))

;;;;;;;; top level

(defun top ()
  (let ((dispatcher (make-instance 'Dispatcher))
	(helloworld (make-instance 'helloworld)))
    (initialize helloworld dispatcher)
    (kickstart helloworld)
    (dispatch dispatcher)))
