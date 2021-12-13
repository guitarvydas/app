
import json
import html
import re

with open('out.json') as f:
  data = json.load(f)

def printScript (component, outf):
  code = html.unescape (component["synccode"])
  code2 = re.sub (r'<div>([^<]*)</div>', r'\1\n', code)
  code3 = re.sub (r'<p ([^>]*)>', r'', code2)
  code4 = re.sub (r'</p>', "", code3)
  code5 = re.sub (r'<span ([^<]*)>', "", code4)
  code6 = re.sub (r'</span>', "\n", code5)
  code7 = re.sub (r'<br>', "\n", code6)

  codefinal = html.unescape (code7)
  print (codefinal, file=outf)

for componentArray in data:
  for component in componentArray:
    fname = component["name"] + ".bash"
    with open (fname, "w") as script:
      print ("# ", file=script, end="")
      print (fname, file=script, end="\n")
      printScript (component, script)
