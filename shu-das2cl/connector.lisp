(defclass Sender ()
  ((component :accessor component :initarg :component)
   (pin :accessor pin :initarg :pin))

(defclass Receiver ()
  ((component :accessor component :initarg :component)
   (pin :accessor pin :initarg :pin))

(defclass Connector () 
  ((sender :accessor sender :initform nil :initarg sender)
   (receiver :accessor receiver :initform nil :initarg receivers)))

(defmethod match-sender-p ((self Connector) (sender Sender))
  (match sender (self sender)))

(defmethod get-receivers-for-sender ((self Connector) (sender Sender))
  (if (match-sender-p self sender)
      (receivers self)
    nil))
  
(defmethod match ((self Sender) (other Sender))
  (and (eq (component self) (component other))
       (eq (pin self) (pin other))))