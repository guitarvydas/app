#!/usr/bin/env python3
# world.py
# cell_11
import mpos
import dispatcher

class _world (mpos.Leaf):

    def __init__ (self, dispatcher, parent, debugID):
        super ().__init__ (dispatcher, parent, debugID)
        self.inputs=['in']
        self.outputs=[]
    def react (self, inputMessage):
        print ("world")
        
        return super ().react (inputMessage)
