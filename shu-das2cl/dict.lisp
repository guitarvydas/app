(in-package :mpos)

(defclass Dict ()
  ((dict :accessor dict :initform (make-hash-table :test 'equal))))

(defmethod set-contents-from-plist ((self Dict) plist)
  (loop while plist
        do (let ((name (first plist))
                 (datum (second plist)))
             (setf (gethash name (dict self)) datum)
             (setf plist (cdr (cdr plist))))))

(defun make-dict (plist)
  (let ((d (make-instance 'Dict)))
    (set-contents-from-plist d plist)
    d))
                 
(defmethod dict-to-datum-list ((self Dict))
  (let ((result nil))
    (maphash #'(lambda (k v)
                 (declare (ignore k))
                 (push v result))
             (dict self))
    result))

(defmethod lookup-by-string ((self Dict) (key string))
  (gethash key (dict self)))

          