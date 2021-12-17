(in-package :mpos)
  
(defclass component ()
  ((input-fifo :accessor input-fifo :initarg :input-fifo :initform (make-instance 'message-fifo))
   (outputs :accessor outputs :initarg nil)
   (parent :accessor parent :initarg :parent :initform nil)
   (debug-id :initform "" :initarg :debug-id)))
  
(defclass leaf (component) ())
(defclass container (component)
  ((children :accessor children :initarg :children :initform (make-instance 'Dict))
   (connections :accessor connections :initarg :connections)))

(defgeneric initialize (self dispatcher))
(defgeneric react (self input-message))
(defgeneric send (self pin datum))
(defgeneric ready-p (self))
(defgeneric busy-p (self))
(defgeneric kickstart (self))
(defgeneric enqueue-input (self m))
(defgeneric clear-outputs (self))

(defgeneric pop-first-input-message (Component))
(defgeneric propagate-input-to-children (Container Input-Message))

(defgeneric set-children (Container Dict))