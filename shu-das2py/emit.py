#!/usr/bin/env python3

import sys
import json
import html
import re

with open(sys.argv[1]) as f:
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

def unescapeCode (s):
  code = html.unescape (s)
  # note that <p .../> and <span .../> are not handled by the
  # code below (this probably needs a parser - e.g. Ohm-JS - to grok
  # It looks like we can get away, though, with the simplification below, because
  # draw.io creates paras and spans in only very specific ways, if
  # we find a counter-example, it might be necessary to cut over to a
  # proper parse (e.g. using pfr and .ohm/.glue files))
  code2 = re.sub (r'<div>([^<]*)</div>', r'\1\n', code)
  code3 = re.sub (r'<p ([^>]*)>', r'', code2)
  code4 = re.sub (r'</p>', "", code3)
  code5 = re.sub (r'<span ([^<]*)>', "", code4)
  code6 = re.sub (r'</span>', "\n", code5)
  code7 = re.sub (r'<br>', "\n", code6)

  codefinal = html.unescape (code7)
  return codefinal

def printCommonHeader (component, outf):

  name = component["name"]
  idkey = component ["id"]
  inputs = component ["inputs"]
  outputs = component ["outputs"]
  code = unescapeCode (component["synccode"])

  print (f'#!/usr/bin/env python3', file=outf)
  print (f'# {fname}', file=outf)
  print (f'# {idkey}', file=outf)

def printCommonImports (component, outf):

  name = component["name"]
  idkey = component ["id"]
  inputs = component ["inputs"]
  outputs = component ["outputs"]
  code = unescapeCode (component["synccode"])

  print ("import mpos", file=outf)
  print ("import dispatcher", file=outf)

def printCommonBody (component, outf):

  name = component["name"]
  idkey = component ["id"]
  inputs = component ["inputs"]
  outputs = component ["outputs"]
  code = unescapeCode (component["synccode"])

  print (f'class _{name} (mpos.Leaf):', file=outf)
  print (f'    def __init__ (self, dispatcher, parent, debugID):', file=outf)
  print (f'        super ().__init__ (dispatcher, parent, debugID)', file=outf)
  print (f'        self.inputs={inputs}', file=outf)
  print (f'        self.outputs={outputs}', file=outf)
  print (file=outf)
  print (f'    def react (self, message):', file=outf)
  printLines (8, code, file=outf)
  print (f'        return super ().react (message)', file=outf)
  

def printLeafScript (component, outf):
  printCommonHeader (component, outf)
  printCommonImports (component, outf)
  printCommonBody (component, outf)

def printContainerScript (component, outf):

  printCommonHeader (component, outf)

  name = component ["name"]
  idkey = component ["id"]
  inputs = component ["inputs"]
  outputs = component ["outputs"]
  code = ""  # no sync code for Containers

  children = component ["children"]
  connections = component ["connections"]

  printCommonImports (component, outf)
  for child in component ["children"]:
    print (f'import {child}', file=outf)

  printCommonBody (component, outf)

  # # uncomment to see json structure
  # # print (file=outf)
  # # print (f'# {component}', file=outf)
  # # print (file=outf)
  
  for childname in children:
    print (f'        child_{childname} = {childname}._{childname} (dispatcher, self, \'{childname}\')', file=outf)

  # i = 0
  # for conn in connections:
  # #       sender = mpos.Sender (hello, "out")
  #   sender = conn ['sender']
  #   sendername = sender ['component']
  #   portname = sender ['port']
  #   print (f'      sender = mpos.Sender (child_{sendername}, "{portname}")', file=outf)
  # # reciever should be a list, but currently it is a single object
  # #       for receiver in conn
  #   receiver = conn ['receiver']
  #   receivername = receiver ['component']
  #   receiverport = receiver ['port']
  # #       rworld = mpos.Receiver (world, "in")
  # #       receivers = [ rworld ]
  #   print (f'      r_{receivername} = mpos.Receiver (child_{receivername}, "{receiverport}")', file=outf)
  # #       conn1 = mpos.Connector (sender, receivers)
  #   print (f'      conn{i} = mpos.Connector (sender, [', end="", file=outf)
  #   print (f' r_{receivername}', end="", file=outf)
  #   print (f' ])', file=outf)

  #   i += 1

  # print ( '      self.children = {', end='', file=outf)
  # n = len (component ['children']) - 1
  # i = 0
  # for name in component ["children"]:
  #   print (f'"{name}": child_{name}', end='', file=outf)
  #   if i < n:
  #     print (f', ', end="", file=outf)
  #   i += 1
  # print ( '}', file=outf)

  # i = 0
  # n = len (component ['connections']) - 1
  # print (f'      self.connections = [', end='', file=outf)
  # for conn in component ['connections']:
  #   print (f'conn{i}', end="", file=outf)
  #   if i < n:
  #     print (f', ', end='', file=outf)
  #   i += 1
  # print (f']', file=outf)

def printScript (component, outf):
  if (isContainer (component)):
    printContainerScript (component, outf)
  else:
    printLeafScript (component, outf)

for componentArray in data:
  for component in componentArray:
    fname = component["name"] + ".py"
    with open (fname, "w") as script:
      printScript (component, script)

with open ('top.py', 'w') as top:
  print (f'#!/usr/bin/env python3', file=top)
  print (f'import {sys.argv [2]}', file=top)
  print (f'import dispatcher', file=top)
  print (f'import {sys.argv [2]}', file=top)
  print (f'disp = dispatcher.Dispatcher ()', file=top)
  print (f'top = {sys.argv[2]}._{sys.argv [2]} (disp)', file=top)
  print (f'top.kickstart ()', file=top)
  print (f'disp.dispatch ()', file=top)

