#!/usr/bin/env python3
import helloworld
import dispatcher
disp = dispatcher.Dispatcher ()
top = helloworld (disp)
top.kickstart ()
disp.dispatch ()
