(in-package :mpos)

(defclass Dispatcher ()
  ((registry :accessor registry :initform nil)
   (output-bucket :accessor output-bucket :initform nil)))

(defmethod dump-output-bucket ((self Dispatcher) (container Container))
  ;; 1.
  (when (not (null (output-bucket self)))
    (loop for output-message in (output-bucket self)
          do ;; output-message = take next output message from bucket
          ;; 2.
          (let ((receiver-list (get-receivers-based-on-message container output-message)))
            ;; 3.
            (loop for receiver in receiver-list
                  do ;; receiver = get-next-receiver
                  ;; 4
                  (deliver-output-message-to-input-pin-of-receiver self output-message receiver))))))

(defmethod dump-output-bucket ((self Dispatcher) (container (eql nil)))
  ;; output from top level component (with nil parent)
  (when (output-bucket self)
    (format *standard-output* "~a~%" (output-bucket self))))

(defmethod invoke-component ((self Dispatcher) (component Component) (message Input-Message))
  (clear-outputs component)
  (setf (output-bucket self) (react component message)))

(defmethod dispatch ((self Dispatcher))
  (loop while (any-component-ready-p self)
        do (dispatch1 self))
  (values))

(defmethod dispatch1 ((self Dispatcher))
  (loop for component in (registry self)
        do (when (ready-p component)
             (let ((input-message (pop-first-input-message component)))
               (invoke-component self component input-message)
               (dump-output-bucket self (parent component))))))

(defmethod deliver-output-message-to-input-pin-of-receiver ((self Dispatcher) (output-message Output-Message) (receiver Receiver))
  (let ((input-message (make-instance 'input-message :component (component receiver) :pin (pin receiver) :data (data output-message))))
    (enqueue-input (component receiver) input-message)))

(defmethod register-component ((self Dispatcher) (component Component))
  (push component (registry self)))

(defmethod any-component-ready-p ((self Dispatcher))
  (some #'(lambda (c)
            (ready-p c))
        (registry self)))

(defmethod get-component-list ((self Dispatcher))
  ;; return a list of all components in the system
  ;; implementation: ATM, registry is already a list
  (registry self))