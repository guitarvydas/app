import dispatcher
import queue

from typing import NoReturn


class Sender:
    def __init__ (self, c,p):
        self.component = c
        self.pin = p

    def __eq__ (self, other):
        if isinstance(other, Sender):
            return self.component is other.component and self.pin == other.pin
        else:
            return False

    def asSender (self):
        return self

class Receiver:
    def __init__ (self, c, p):
        self.component = c
        self.pin = p

    def deliverOutputMessageToInputPinOfReceiver (self, outputMessage):
        inputMessage = InputMessage (self.component, self.pin, outputMessage.data)
        component = self.component
        component.enqueueInput (inputMessage)

class Message:
    def __init__ (self, c, p, d):
        self.component = c
        self.pin = p
        self.data = d

    def sender (self):
        s = Sender (self.component, self.pin)
        return s

    def getPin (self):
        return self.pin
    
    def getComponent (self):
        return self.component

class InputMessage (Message):
    pass

class OutputMessage (Message):
    pass

class MessageFifo (queue.Queue):
    def enqueue (self, m):
        self.put (m)

    def dequeue (self):
        return self.get ()

    def emptyP (self):
        return self.empty ()

class Connector:
    def __init__ (self, senders, receivers):
        self.senders = sender
        self.receivers = receivers
    
    def getReceiversBasedOnSender (self, sender):
        assert (self.sender == sender)
        return self.receivers
    
    def matchSender (self, targetSender):
        return any (self.sender == targetSender)

    def getReceiversBasedOnMessage (self, message):
        s = message.sender ()
        r = self.getReceiversBasedOnSender (message.sender ())
        return r

class Component:
        def __init__ (self, dispatcher, container, debugID):
            self.inputs = []
            self.outputs = []
            self.outputBucket = []
            self.parent = container
            self.debugID = debugID
            self.inputQueue = MessageFifo ()
            self.reaction = None
            dispatcher.register (self)

        def popFirstInput (self):
            if self.inputQueue.emptyP ():
                return None
            else:
                message = self.inputQueue.dequeue ()
                return message
        
        def clearOutputBucket (self):
            self.outputBucket = []

        def readyP (self):
            return 0 < self.inputQueue._qsize ()

        def enqueueInput (self, m):
            self.inputQueue.enqueue (m)

        def kickstart (self):
            m = Message (self, "_", True)
            self.enqueueInput (m)

        def send (self, pin, data):
            message = Message (self, pin, data)
            self.outputBucket.append (message)

        def react (self, message):
            return self.outputBucket

        def getContainer (self):
            return self.parent

        def hasOutputsP (self):
            return (0 < len (self.outputBucket))


class Leaf (Component):
    pass

class Container (Component):
    def __init__ (self, dispatcher, parent, debugID):
        super ().__init__ (dispatcher, parent, debugID)
        self.children = []
        self.connections = []

    def busyP (self):
        for child in self.children:
            if child.busyP ():
                return True
        return False

    def propagateInputToChildren (self, m):
        conn = self.findConnectionBasedOnMessage (m)
        receivers = conn.getReceiversBasedOnMessage (m)
        for r in receivers:
            msg = Message (r.component, r.pin, m.data)
            r.component.enqueueInput (msg)

    def findConnectionBasedOnMessage (self, m):
        for conn in self.connections:
            if conn.sender == m.sender ():
                return conn
        assert False, "internal error"

    def react (self, message):
        self.propagateInputToChildren (message)
        return super ().react (message)

    
