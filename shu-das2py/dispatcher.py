class Dispatcher:
    registry = []
    outputBucket = []

    def dumpOutputBucket (self, container, outputBucket):
        if container:
            if 0 < len (self.outputBucket):
                for outputMessage in outputBucket:
                    for receiver in self.getReceiversBasedOnMessage (container, outputMessage):
                        receiver.deliverOutputMessageToInputPinOfReceiver (outputMessage)
        else:
            for m in outputBucket:
                print (m) # top level has no container, just dump message to stdout


    def registerComponent (self, component):
        self.registry.append (component)

    def anyComponentReadyP (self):
        for c in self.registry:
            if c.readyP ():
                return True
        assert False, "internal error"

    def invokeComponent (self, component, message):
        component.clearOutputs ()
        self.outputBucket = component.react (message)

    def dispatch (self):
        while self.anyComponentReadyP ():
            self.dispatch1 ()

    def dispatch1 (self):
        for c in self.registry:
            if c.readyP:
                message = c.popFirstInput ()
                outputs = self.invokeComponent (c, message)
                self.dumpOutputBucket (c, outputs)
             