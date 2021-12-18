import dispatcher
import queue

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
        s = Sender (self.component, self.pin)
        return s

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
            return 0 < self.inputQueue._qsize ()

        def enqueueInput (self, m):
            self.inputQueue.enqueue (m)

        def kickstart (self):
            m = Message (self, "start", True)
            self.enqueueInput (m)

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
            if conn.sender == m.sender:
                return conn
        assert False

    def react (self, message):
        self.propagateMessageToChildren (message)

    
