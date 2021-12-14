import json
import html
import re

with open('escaped-out.json') as inf:
  data = inf.read()
  unescaped = html.unescape (data)
  with open('out.json', 'w') as outf:
      outf.write (data)
