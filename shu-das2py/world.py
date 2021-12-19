#!/usr/bin/env python3
# world.py
import mpos
import dispatcher

class world (mpos.Leaf):
    def __init__ (self, dispatcher, parent, debugID):
        super ().__init__ (dispatcher, parent, debugID)
        self.inputs=['in']
        self.outputs=[]

    def react (self, message):
        print ("world")
        
        return super ().react (message)
