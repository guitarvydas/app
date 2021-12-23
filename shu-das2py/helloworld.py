#!/usr/bin/env python3
# helloworld.py
# cell_6
import mpos
import dispatcher
import xworld
import xhello

class _helloworld (mpos.Container):

    def __init__ (self, dispatcher, parent, idInParent):
        super ().__init__ (dispatcher, parent, idInParent)
        self.inputs=['_a']
        self.outputs=[]

        child0 = xworld._xworld (dispatcher, self, 'xworld')
        child1 = xhello._xhello (dispatcher, self, 'xhello')
        conn0 = mpos.Connector ([mpos.Sender ('xhello', 'out')], [mpos.Receiver ('xworld', 'in')])
        self.connections = [ conn0 ]
        self.children = {'xworld':child0, 'xhello':child1}
