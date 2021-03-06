
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
       

def printLeafScript (component, outf):
  code = html.unescape (component["synccode"])
  # note that <p .../> and <span .../> are not handled by the
  # code below (this probably needs a parser - e.g. Ohm-JS - to grok
  # It looks like we can get away with the simplification below, because
  # draw.io creates paras and spans in only very specific ways, if
  # we find a counter-example, it might be easier to cut over to a
  # proper parse (e.g. using pfr and .ohm/.glue files)
  code2 = re.sub (r'<div>([^<]*)</div>', r'\1\n', code)
  code3 = re.sub (r'<p ([^>]*)>', r'', code2)
  code4 = re.sub (r'</p>', "", code3)
  code5 = re.sub (r'<span ([^<]*)>', "", code4)
  code6 = re.sub (r'</span>', "\n", code5)
  code7 = re.sub (r'<br>', "\n", code6)

  codefinal = html.unescape (code7)
  print (codefinal, file=outf)

def printContainerScript (component, outf):
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
    print (f'./{child}.bash ', file=outf, end="")
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
    fname = component["name"] + ".bash"
    with open (fname, "w") as script:
      print (f'# {fname}', file=script)
      printScript (component, script)
