(defclass dict ()
  ;; dumb implementation using property-list for table
  ((table :accessor table :initarg :map)))

(defmethod lookup ((self dict) (name string))
  (get name (table self)))
