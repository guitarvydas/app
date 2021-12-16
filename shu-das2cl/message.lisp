(in-package :mpos)

(defclass Message ()
  ((component :accessor component :initarg :component)
   (pin :accessor pin :initarg :pin)
   (data :accessor data :initarg :data)))

(defclass output-message (Message) ())
(defclass input-message (Message) ())

(defun make-input-message (component pin value)
  (make-instance 'Input-Message :component component :pin pin :data value))

(defun make-output-message (component pin value)
  (make-instance 'Output-Message :component component :pin pin :data value))
