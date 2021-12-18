import mpos
import dispatcher

class Hello (mpos.Leaf):
    def __init__ (self, dispatcher, parent, debugID):
        super ().__init__ (dispatcher, parent, debugID)
        self.outputs = ["out"]

    def react (self, inputMessage):
        print ("hello")
        mpos.send (self, "out", True)

class World (mpos.Leaf):
    def __init__ (self, dispatcher, parent, debugID):
        super ().__init__ (dispatcher, parent, debugID)
        self.inputs = ["in"]

    def react (self, inputMessage):
        print ("world")

class HelloWorld (mpos.Container):
    def __init__ (self, dispatcher):
        super ().__init__ (dispatcher, None, "helloworld")
        hello = Hello (dispatcher, self, "hello")
        world = World (dispatcher, self, "world")
    
        sender = mpos.Sender (self, "start")
        rchild = mpos.Receiver (hello, "start")
        receivers = [ rchild ]
        conn0 = mpos.Connector (sender, receivers)
    
        sender = mpos.Sender (hello, "out")
        rworld = mpos.Receiver (world, "in")
        receivers = [ rworld ]
        conn1 = mpos.Connector (sender, receivers)

        self.children = { "hello": hello, "world": world }
        self.connections = [ conn0, conn1 ]


disp = dispatcher.Dispatcher ()
hw = HelloWorld (disp)
hw.kickstart ()
disp.dispatch ()