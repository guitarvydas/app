#!/usr/bin/env python3

import sys
import json
import html
import re

with open('out.json') as f:
  data = json.load(f)

def isContainer (component):
  if (0 < len (component["children"])):
      return True
  else:
      return False
       
def printIndent (n, file=""):
  while n > 0:
    print (" ", end="", file=file)
    n -= 1
    
def printLines (indent, str, file=""):
  for line in str.splitlines ():
    printIndent (indent, file=file);
    print (line, file=file)

def printLeafScript (component, outf):
  code = html.unescape (component["synccode"])
  # note that <p .../> and <span .../> are not handled by the
  # code below (this probably needs a parser - e.g. Ohm-JS - to grok
  # It looks like we can get away, though, with the simplification below, because
  # draw.io creates paras and spans in only very specific ways, if
  # we find a counter-example, it might be necessary to cut over to a
  # proper parse (e.g. using pfr and .ohm/.glue files)
  code2 = re.sub (r'<div>([^<]*)</div>', r'\1\n', code)
  code3 = re.sub (r'<p ([^>]*)>', r'', code2)
  code4 = re.sub (r'</p>', "", code3)
  code5 = re.sub (r'<span ([^<]*)>', "", code4)
  code6 = re.sub (r'</span>', "\n", code5)
  code7 = re.sub (r'<br>', "\n", code6)

  codefinal = html.unescape (code7)

  print ("import mpos", file=outf)
  print ("import dispatcher", file=outf)
  print (file=outf)
  print (f'class {component["name"]} (mpos.Leaf):', file=outf)
  print (f'    def __init__ (self, dispatcher, parent, debugID):', file=outf)
  print (f'        super ().__init__ (dispatcher, parent, debugID)', file=outf)
  print (f'        self.inputs={component["inputs"]}', file=outf)
  print (f'        self.outputs={component["outputs"]}', file=outf)
  print (file=outf)
  print (f'    def react (self, message):', file=outf)
  printLines (8, codefinal, file=outf)

def printContainerScript (component, outf):
  print ("import mpos", file=outf)
  print ("import dispatcher", file=outf)
  for name in component ["children"]:
    print (f'import {name}', file=outf)
  print (file=outf)
  print (f'class {component["name"]} (mpos.Container):', file=outf)
  print (f'    def __init__ (self, dispatcher):', file=outf)
  print (f'      super ().__init__ (dispatcher, None, \'{component["name"]}\')', file=outf)

  # uncomment to see json structure
  # print (file=outf)
  # print (f'# {component}', file=outf)
  # print (file=outf)
  
  for name in component ["children"]:
    print (f'      child_{name} = {name} (dispatcher, self, \'{name}\')', file=outf)

  i = 0
  for conn in component ['connections']:    
  #       sender = mpos.Sender (hello, "out")
    sender = conn ['sender']
    sendername = sender ['component']
    portname = sender ['port']
    print (f'      sender = mpos.Sender (child_{sendername}, "{portname}")', file=outf)
  # reciever should be a list, but currently it is a single object
  #       for receiver in conn
    receiver = conn ['receiver']
    receivername = receiver ['component']
    receiverport = receiver ['port']
  #       rworld = mpos.Receiver (world, "in")
  #       receivers = [ rworld ]
    print (f'      r_{receivername} = mpos.Receiver (child_{receivername}, "{receiverport}")', file=outf)
  #       conn1 = mpos.Connector (sender, receivers)
    print (f'      conn{i} = mpos.Connector (sender, [', end="", file=outf)
    print (f' r_{receivername}', end="", file=outf)
    print (f' ])', file=outf)

    i += 1

    

def printScript (component, outf):
  if (isContainer (component)):
    printContainerScript (component, outf)
  else:
    printLeafScript (component, outf)

for componentArray in data:
  for component in componentArray:
    fname = component["name"] + ".py"
    with open (fname, "w") as script:
      print (f'#!/usr/bin/env python3', file=script)
      print (f'# {fname}', file=script)
      printScript (component, script)

with open ('top.py', 'w') as top:
  print (f'#!/usr/bin/env python3', file=top)
  print (f'import {sys.argv [1]}', file=top)
  print (f'import dispatcher', file=top)
  print (f'disp = dispatcher.Dispatcher ()', file=top)
  print (f'top = {sys.argv [1]} (disp)', file=top)
  print (f'top.kickstart ()', file=top)
  print (f'disp.dispatch ()', file=top)

