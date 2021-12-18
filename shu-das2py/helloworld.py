import mpos
import dispatcher

class Hello (mpos.Leaf):
    def react (self, inputMessage):
        print ("hello")
        mpos.send (self, "out", True)

class World (mpos.Leaf):
    def react (self, inputMessage):
        print ("world")

class HelloWorld (mpos.Container):
    def __init__ (self, dispatcher):
        super ().__init__ (self, dispatcher)
        hello = Hello (dispatcher)
        world = World (dispatcher)
    
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