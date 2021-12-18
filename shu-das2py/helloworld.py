import mpos

class Hello (Leaf):
    def react (self, inputMessage):
        print ("hello")
        send (self, "out", True)

class World (Leaf):
    def react (self, inputMessage):
        print ("world")

class HelloWorld (Container):
    def __init__ (self, dispatcher):
        super ().__init__ (self, dispatcher)
        hello = Hello (dispatcher)
        world = World (dispatcher)
    
        sender = Sender (self, "start")
        rchild = Receiver (hello, "start")
        receivers = [ rchild ]
        conn0 = Connector (sender, receivers)
    
        sender = Sender (hello, "out")
        rworld = Receiver (world, "in")
        receivers = [ rworld ]
        conn1 = Connector (sender, receivers)

        self.children = { "hello": hello, "world": world }
        self.connections = [ conn0, conn1 ]

dispatcher = Dispatch ()
hw = HelloWorld (dispatcher)
hw.kickstart ()
dispatcher.Distpatch ()