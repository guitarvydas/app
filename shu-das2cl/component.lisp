  
(defclass component ()
  ((input-queue :accessor input-queue :initarg :input-queue :initform nil)
   (output-queue :accessor output-queue :initarg :output-queue :initform nil)
   (parent :accessor parent)))
  
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
  (push (output-queue self) m))

(defmethod initialize ((self component) (in message-queue) (out message-queue) (dispatcher Dispatcher))
  (add-component dispatcher self))

(defmethod ready-p ((self component))
  (and (not (null (input-queue self)))
       (not (busy-p self))))

(defmethod get-and-reset-outputs ((self component) )
  (let ((outlist (reverse (output-queue self))))
    (setf (output-queue self) nil)
    outlist))

(defmethod react ((self container) (m message))
  (loop for child in (children self)
	do (enqueue-message child m)))

(defmethod busy-p ((self leaf)) nil)
(defmethod busy-p ((self container)) (notany #'busy-p (children self)))

(defmethod enqueue-message ((self component) (m message))
  (enqueue (input-queue self) m))

(defmethod kickstart ((self component))
  (enqueue-message self t))

(defmethod get-receivers ((self container) (sender component))
  ;; return list of components that are connected to sender's output
  (for conn in (connections self)
       collect (and (eq sender (sender conn)) (receiver conn))))
