#!/usr/bin/env python3
import hellworld
import dispatcher
disp = dispatcher.Dispatcher ()
top = hellworld._hellworld (disp, None, '')
top.kickstart ()
disp.dispatch ()
