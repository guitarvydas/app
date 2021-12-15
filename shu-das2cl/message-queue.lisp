(defclass message-queue ()
  ((q :accessor q)))

(defmethod enqueue ((self message-queue) item)
  (push (q self) item))

(defmethod dequeue ((self message-queue))
  (pop (q self)))

(defclass message (T) ())
  
