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

      conn1 = mpos.Connector (
          # array of senders
          [
              { 'component' : 'hello', 'port' : 'out' }
          ],
          # array of receivers
          [
              { 'component' : 'world', 'port' : 'in' }
          ])

      conn0 = mpos.Connector (
          [ {'component' : '', 'port' : '_'} ],
          [ {'component' : 'hello', 'port' : '_'} ])

      self.connections = [ conn0, conn1 ]
      self.children = { 'hello': child_hello, 'world': child_world }
