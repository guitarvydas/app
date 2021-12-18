
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
  print (f'class {component["name"]} (self, mpos.Leaf):', file=outf)
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
  print (file=outf)
  print (f'class HelloWorld (mpos.Container):', file=outf)
  print (f'    def __init__ (self, dispatcher):', file=outf)
  print (f'      super ().__init__ (dispatcher, None, \'{component["name"]}\')', file=outf)
  connections = component ["connections"]
  children = component ["children"]
  connection = []
  outputTable = {}
  inputTable = {}
  i = 0
  for conn in connections:
    # good enough for example
    # not good enough in general (must coalesce all connections that go to the same input)
    name = "conn" + str (i)
    connection.append ("$" + name)
    print (f'{name}={name}_$RANDOM', file=outf)
    print (f'mkfifo {connection [i]}', file=outf)
    senderComponentAndPort = conn ["sender"]
    receiverComponentAndPort = conn ["receiver"]
    sender = senderComponentAndPort ["component"]
    receiver = receiverComponentAndPort ["component"]
    outputTable [sender] = connection [i]
    inputTable [receiver] = connection [i]
    # print (f'connection={connection [i]} sender={sender} receiver={receiver}')
    i += 1
  for child in children:
    print (f'./{child}.py ', file=outf, end="")
    conn = outputTable.get (child)
    if (conn):
      print (f'4>{conn} ', end="", file=outf)
    inconn = inputTable.get (child)
    if (inconn):
      print (f'3<{inconn} ', end="", file=outf)
    print (" &", file=outf)
    print (f'pid_{child}=$!', file=outf)
  for child in children:
    print (f'wait $pid_{child}', file=outf)
  i = 0
  for conn in connections:
    print (f'rm {connection [i]}', file=outf)
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
      print (f'#!/bin/local/env python3', file=script)
      print (f'# {fname}', file=script)
      printScript (component, script)
