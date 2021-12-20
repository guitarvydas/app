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
        self.outputs=['_']

    def react (self, message):
        return super ().react (message)
        child_world = world._world (dispatcher, self, 'world')
        child_hello = hello._hello (dispatcher, self, 'hello')
