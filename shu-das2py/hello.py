#!/usr/bin/env python3
# hello.py
# cell_7
import mpos
import dispatcher

class _hello (mpos.Leaf):

    def __init__ (self, dispatcher, parent, debugID):
        super ().__init__ (dispatcher, parent, debugID)
        self.inputs=['_']
        self.outputs=['out']
    def react (self, message):
        print ("hello")
        self.send ("out", True)
        
        return super ().react (message)
