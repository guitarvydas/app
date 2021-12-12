
import json

with open('out.json') as f:
  data = json.load(f)

#print(data)
#print(json.dumps(data, indent = 4, sort_keys=True))
print(json.dumps(data, indent = 2))
