#!/usr/bin/env python3
# helloworld.py
# cell_6
import mpos
import dispatcher
import world
import hello

class _helloworld (mpos.Leaf):

    def __init__ (self, dispatcher, parent, debugID):
        super ().__init__ (dispatcher, parent, debugID)
        self.inputs=[]
        self.outputs=[]

    def react (self, inputMessage):
        return super ().react (inputMessage)
        child_world = world._world (dispatcher, self, 'world')
        child_hello = hello._hello (dispatcher, self, 'hello')
        conn0 = mpos.Connector ([{ 'component': '', 'port': '_'}], [{ 'component': '', 'port': '_'}])
        conn1 = mpos.Connector ([{ 'component': 'hello', 'port': 'out'}], [{ 'component': 'hello', 'port': 'out'}])
        self.children = ["world":world, "hello":hello]
        self.connections = [ conn0, conn1 ]
