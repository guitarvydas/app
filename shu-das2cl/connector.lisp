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

(defmethod match-sender-p ((self Connector) (sender Sender))
  (match sender (sender self)))

(defmethod match-sender-p ((self Connector) (message Message))
  (match message (sender self)))

(defmethod get-receivers-for-sender ((self Connector) (sender Sender))
  (if (match-sender-p self sender)
      (receivers self)
    nil))
  
(defmethod match ((self Sender) (other Sender))
  (and (eq (component self) (component other))
       (eq (pin self) (pin other))))

(defmethod match ((self Message) (other Sender))
  (and (eq (component self) (component other))
       (eq (pin self) (pin other))))

(defmethod get-receivers-based-on-message ((self Connector) (message Message))
  (let ((sender (make-instance 'Sender :component (component message) :pin (pin message))))
    (get-receivers-for-sender self sender)))

