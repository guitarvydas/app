#!/usr/bin/env python3
import helloworld
import dispatcher
import helloworld
disp = dispatcher.Dispatcher ()
top = helloworld._helloworld (disp)
top.kickstart ()
disp.dispatch ()
