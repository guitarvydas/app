(defsystem :mpos
  :around-compile (lambda (next)
                    (proclaim '(optimize (debug 3) (safety 3) (speed 0)))
                    (funcall next))
  :components ((:module "source"
                        :pathname "./"
                        :components ((:file "package")
                                     (:file "message" :depends-on ("package"))
                                     (:file "message-fifo" :depends-on ("package"))
                                     (:file "connector" :depends-on ("package"))
                                     (:file "component-class" :depends-on ("package" "message" "message-fifo" "connector")
                                     (:file "dispatcher" :depends-on ("package" "component-class"))
                                     #+nil(:file "component" :depends-on ("package" "message" "message-fifo" "connector" "dispatcher" "component-class")
                                     #+nil(:file "helloworld" :depends-on ("package" "component"))))))

