  
(defclass component ()
  ((input-fifo :accessor input-fifo :initarg :input-fifo :initform (make-instance 'message-fifo))
   (outputs :accessor outputs :initarg nil)
   (parent :accessor parent :initarg :parent :initform nil)))
  
(defclass leaf (component) ())
(defclass container (component)
  ((children :accessor children :initarg :children)
   (connections :accessor connections :initarg :connections)))

(defgeneric initialize (self in out dispatcher))
(defgeneric react (self message))
(defgeneric send (self datum))
(defgeneric ready-p (self))
(defgeneric busy-p (self))
(defgeneric kickstart (self))
(defgeneric enqueue-message (self m))
(defgeneric get-receivers (self sender))

(defmethod send ((self component) (m message))
  (push (outputs self) m))

(defmethod initialize ((self component) (in message-fifo) (out message-fifo) (dispatcher Dispatcher))
  (add-component dispatcher self))

(defmethod ready-p ((self component))
  (and (not (null (input-fifo self)))
       (not (busy-p self))))

(defmethod react ((self container) (m message))
  (loop for child in (children self)
	do (enqueue-message child m))
  (outputs self)) ;; return outputs (if any) to Dispatcher

(defmethod busy-p ((self leaf)) nil)
(defmethod busy-p ((self container)) (notany #'busy-p (children self)))

(defmethod enqueue-message ((self component) (m message))
  (enqueue (input-fifo self) m))

(defmethod kickstart ((self component))
  (enqueue-message self t))
