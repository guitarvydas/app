#!/usr/bin/env python3
# helloworld.py
import mpos
import dispatcher
import world
import hello

class _helloworld (mpos.Container):
    def __init__ (self, dispatcher):
      super ().__init__ (dispatcher, None, 'helloworld')
      child_world = world._world (dispatcher, self, 'world')
      child_hello = hello._hello (dispatcher, self, 'hello')
      sender = mpos.Sender (child_hello, "out")
      r_world = mpos.Receiver (child_world, "in")
      conn0 = mpos.Connector (sender, [ r_world ])
      self.children = {"world": child_world, "hello": child_hello}
      self.connections = [conn0]
