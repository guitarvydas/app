class Dispatcher:
    registry = []
    outputBucket = None

    def dumpOutputBucket (self, component, outputBucket):
        if component:
         if component.hasOutputsP ():
                container = component.getContainer ()
                for outputMessage in outputBucket:
                    connection = container.findConnectionBasedOnMessage (outputMessage)
                    receiversList = connection.getReceiversBasedOnMessage (outputMessage)
                    for receiver in receiversList:
                        receiver.deliverOutputMessageToInputPinOfReceiver (outputMessage)
        else:
            for m in outputBucket:
                print (m) # top level has no container, just dump message to stdout


    def register (self, component):
        self.registry.append (component)

    def anyComponentReadyP (self):
        for c in self.registry:
            if c.readyP ():
                return True
        return False

    def invokeComponent (self, component, message):
        component.clearOutputBucket ()
        return component.react (message)

    def dispatch (self):
        while self.anyComponentReadyP ():
            self.dispatch1 ()

    def dispatch1 (self):
        for c in self.registry:
            if c.readyP ():
                message = c.popFirstInput ()
                outputs = self.invokeComponent (c, message)
                self.dumpOutputBucket (c, outputs)
             