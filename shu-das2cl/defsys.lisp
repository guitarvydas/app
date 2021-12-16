(defsystem mpos (:optimize ((speed 0) (space 0) (safety 3) (debug 3)))
  :members (
            "package"
            "dict"
            "message"
            "message-fifo"
            "connector"
            "component-class"
            "dispatcher"
            "component"
            "helloworld"
            )
  :rules ((:compile :all (:requires (:load :previous)))))
