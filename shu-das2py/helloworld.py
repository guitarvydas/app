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
