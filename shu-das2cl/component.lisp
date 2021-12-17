(in-package :mpos)

(defmethod clear-outputs ((self component))
  (setf (outputs self) nil))

(defmethod send ((self component) pin value)
  (push (make-output-message self pin value) (outputs self)))

(defmethod initialize ((self component) (dispatcher Dispatcher))
  (register-component dispatcher self))

(defmethod ready-p ((self component))
  (and (not (empty-p (input-fifo self)))
       (not (busy-p self))))

(defmethod react ((self container) (m input-message))
  (loop for child in (children self)
	do (enqueue-input child m))
  (outputs self)) ;; return outputs (if any) to Dispatcher

(defmethod busy-p ((self leaf)) nil)
(defmethod busy-p ((self container)) 
  (some #'(lambda (child)
              (busy-p child))
          (list-children self)))

(defmethod enqueue-input ((self component) (m input-message))
  (enqueue (input-fifo self) m))

(defmethod kickstart ((self Component))
  ;; trick the Dispatcher into running the top component (trick: enqueue a dummy message to the top component)
  (enqueue-input self (make-input-message self "in" t))
  nil)

(defmethod pop-first-input-message ((self Component))
  (dequeue (input-fifo self)))

(defmethod propagate-input-to-children ((self Container) (message Input-Message))
  (let ((conn (find-connection-based-on-message self message)))
    (let ((receivers (get-receivers-based-on-message conn message)))
      (loop for receiver in receivers
            do (let ((input-message (make-instance 'Input-Message :component (component receiver) :pin (pin receiver) :data (data message))))
                 (enqueue-input (component receiver) input-message))))))

(defmethod find-connection-based-on-message ((self Container) (message Message))
  (let ((connections (connections self)))
    (loop for conn in connections
          do (when (match-sender-p conn message)
               (return-from find-connection-based-on-message conn)))
    (assert nil)))

(defmethod set-children ((self Component) (children Dict))
  (setf (children self) children))

(defmethod list-children ((self Component))
  (dict-to-datum-list (children self)))

(defun make-component (clss parent dispatcher debug-id)
  (let ((c (make-instance clss :parent parent :debug-id debug-id)))
    (initialize c dispatcher)
    c))

(defmethod lookup-child ((self Container) (child-name string))
  (let ((child (lookup-by-string (children self) child-name)))
    child))

(defmethod get-receivers-based-on-message ((self Component) (message Message))
  (let ((conn (find-connection-based-on-message self message)))
    (get-receivers-based-on-message conn message)))
        