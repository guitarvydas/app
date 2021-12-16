(defclass Dispatcher ()
  ((run-queue :accessor run-queue :initform nil)))

(defmethod add-component ((self Dispatcher) component)
  (setf (run-queue self) (cons component (run-queue self))))

(defmethod dispatch ((self Dispatcher))
  (loop while (any-component-ready-p self)
	do (dispatch1 self (run-queue self))
	do (mapc #'distribute-outputs (run-queue self))))

(defmethod dispatch1 ((self Dispatcher) run-list)
  (cond ((null run-list) nil)
	(t (let ((component (first run-list))
		 (others (rest run-list)))
	     (when (ready-p component)
	       (let ((message (pop (input-queue component))))
		   (react component message)))
	     (dispatch1 self others)))))

(defmethod any-component-ready-p ((self Dispatcher))
  (some #'ready-p (run-queue self)))

(defmethod dump-output-bucket ((self dispatcher))

(defmethod distribute-outputs ((self Dispatcher) component)
  (let ((outputs (get-and-reset-outputs component)))
    (mapc #(lambda (message)
	    (distribute-output component message))
	  outputs)))

(defmethod distribute-output ((self component) (m message))
  (let ((container (parent self)))
    (let ((receiver-list (get-receivers container self)))
      (loop for r in receiver-list
            do (enqueue-message r m)))))
