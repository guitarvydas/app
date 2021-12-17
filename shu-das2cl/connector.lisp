(in-package :mpos)

(defclass Sender ()
  ((component :accessor component :initarg :component)
   (pin :accessor pin :initarg :pin)))

(defclass Receiver ()
  ((component :accessor component :initarg :component)
   (pin :accessor pin :initarg :pin)))

(defclass Connector () 
  ((sender :accessor sender :initform nil :initarg :sender)
   (receivers :accessor receivers :initform nil :initarg :receivers)))

(defun make-Sender (component pin)
  (make-instance 'Sender :component component :pin pin))

(defun make-Receiver (component pin)
  (make-instance 'Receiver :component component :pin pin))

(defmethod match-sender-p ((self Connector) (sender Sender))
  (match (sender self) sender))
(defmethod match-sender-p ((self Connector) (m Message))
  (match (sender self) (sender m)))

(defmethod get-receivers-for-sender ((self Connector) (sender Sender))
  (if (match-sender-p self sender)
      (receivers self)
    nil))
  
(defmethod match ((self Sender) (other Sender))
  (and (eq (component self) (component other))
       (string= (pin self) (pin other))))

(defmethod get-receivers-based-on-message ((self Connector) (message Message))
  (let ((sender (sender message)))
    (get-receivers-for-sender self sender)))

