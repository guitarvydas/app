(in-package :mpos)

(defclass message-fifo ()
  ((q :accessor q :initform nil)))

(defmethod enqueue ((self message-fifo) message)
  ;; tack message onto end of queue (tail)
  (let ((cell (cons message nil)))
    (if (null (q self))
        (setf (q self) cell)
      (setf (q self) (append (q self) cell)))))

(defmethod dequeue ((self message-fifo))
  (pop (q self))) ;; lisp will check for underrun

(defmethod empty-p ((self message-fifo))
  (null (q self)))