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
  (let ((hello (make-component 'hello self dispatcher "hello"))
        (world (make-component 'world self dispatcher "world")))
    (let ((rworld (make-receiver world "in"))
          (shello (make-sender hello "out")))
      (let ((conn0 (make-instance 'Connector :sender shello :receivers (list rworld))))
        (setf (connections self) (list conn0))
        (set-children self (make-dict (list "hello" hello "world" world)))
        (call-next-method)))))

(defmethod react ((self HelloWorld) (message Input-Message))
  (kickstart (lookup-child self "hello")))

;;;;;;;; top level

(defun top ()
  (let ((dispatcher (make-instance 'Dispatcher)))
    (let ((helloworld (make-component 'helloworld nil dispatcher "hw")))
      (initialize helloworld dispatcher)
      (kickstart helloworld)
      (dispatch dispatcher))))
