#!/bin/local/env python3
# helloworld.py
import mpos
import dispatcher

class HelloWorld (mpos.Container):
    def __init__ (self, dispatcher):
      super ().__init__ (dispatcher, None, 'helloworld')
conn0=conn0_$RANDOM
mkfifo $conn0
./world.py 3<$conn0  &
pid_world=$!
./hello.py 4>$conn0  &
pid_hello=$!
wait $pid_world
wait $pid_hello
rm $conn0
