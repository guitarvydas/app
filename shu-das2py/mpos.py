import dispatcher

from typing import NoReturn


class Sender:
    component = None
    pin = ""

    def __init__ (self, c,p):
        self.component = c
        self.pin = p

    def __eq__ (self, other):
        if self.component == other.component and self.pin == other.pin:
            return True
        else:
            return False

    def asSender (self):
        return self

class Receiver:
    def __init__ (self, c, p):
        self.component = c
        self.pin = p

class Message:
    def __init__ (self, c, p, d):
        self.component = c
        self.pin = p
        self.data = d

    def sender (self):
        s = Sender (c, p)
        return s

class InputMessage (Message):
class OutputMessage (Message):

class MessageFifo:
    def __init__ (self):
        self.q = []

    def enqueue (self, m):
        self.q.appen (m)

    def dequeue (self):
        return self.q.pop (1)

    def emptyP (self):
        return (0 == len (self.q))

    def length (self):
        return len (self.q)

class Connector:
    def __init__ (self, sender, receivers):
        self.sender = sender
        self.receivers = receivers
    
    def getReceiversForSender (self, sender):
        assert (self.sender == sender)
        return self.receivers
    
    def matchSender (self, targetSender):
        return self.sender == targetSender

    def getReceiverBasedOnMessage (self, message):
        return self.getReceiversForSender (self, message.sender ())

    class Component:
        def __init__ (self, dispatcher, container, debugID):
            self.inputs = []
            self.outputs = []
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
        
        def clearOutputs (self):
            self.outputs = []

        def readyP (self):
            return 0 < self.inputQueue.length ()

        def enqueueInput (m):
            self.inputQueue.enqueue (m)

        def kickstart:
            m = Message ("start", True)
            self.enqueueInput (m)

class Leaf (Component):

class Container (Component):
    def __init__ (self):
        super ().__init__ ()
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
            if conn.sender == m.sender:
                return conn
        assert False

    def react (self, message):
        self.propagateMessageToChildren (message)

    
