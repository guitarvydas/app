#!/usr/bin/env python3
# helloworld.py
import mpos
import dispatcher
import sampleworld
import samplehello

class _helloworld (mpos.Container):
    def __init__ (self, dispatcher, parent, idInParent):
      super ().__init__ (dispatcher, parent, idInParent)
      child0 = samplehello._hello (dispatcher, self, 'hello')
      child1 = sampleworld._world (dispatcher, self, 'world')

      conn1 = mpos.Connector (
          # array of senders
          # names must correspond to self.children map
          [
              mpos.Sender ('hello', 'out' )
          ],
          # array of receivers
          [
              mpos.Receiver ('world', 'in' )
          ])

      conn0 = mpos.Connector ( [ mpos.Sender ('', '_') ], [ mpos.Receiver ('hello', '_') ])

      self.connections = [ conn0, conn1 ]
      self.children = { 'hello': child0, 'world': child1 }
