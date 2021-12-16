(defclass Dispatcher ()
  ((registry :accessor registry :initform nil)
   (output-bucket :accessor output-bucket :iniform nil)))

(defmethod dump-output-bucket ((self Dispatcher) (container Container))
  ;; 1.
  (loop for output-message in (output-bucket self)
        do ;; output-message = take next output message from bucket
  ;; 2.
          (let ((receiver-list (get-receivers-based-on-output-message container output-message)))
  ;; 3.
            (loop for receiver in receiver-list
              do ;; receiver = get-next-receiver
  ;; 4
                 (deliver-output-message-to-input-pin-of-receiver self output-message receiver)))))

(defmethod invoke-component ((self Dispatcher) (component Component) (message Input-Message))
  (clear-outputs component)
  (setf output-bucket (funcall (react component) message)))

(defmethod dispatch ((self Dispatcher))
  (loop while (any-component-ready-p self)
        do (dispatch1 self)))

(defmethod dispatch1 ((self Dispatcher))
  (loop for component in (get-component-list (registry self))
        do (when (ready-p component)
             (let ((input-message (pop-first-input-message component)))
               (invoke-component self component input-message)
               (dump-output-bucket self (parent component))))))

(defmethod deliver-output-message-to-input-pin-of-receiver ((self Dispatcher) (output-message Output-Message) (receiver Receiver))
  (let ((input-message (make-instance 'input-message :component (component receiver) :pin (pin receiver) :data (data output-message))))
    (enqueue-input receiver input-message)))

(defmethod register-component ((self Dispatcher) (component Component))
  (push component (registry self)))