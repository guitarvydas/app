
import json

with open('out.json') as f:
  data = json.load(f)

#print(data)
#print(json.dumps(data, indent = 4, sort_keys=True))
#print(json.dumps(data, indent = 2))

# print (len(data))

for componentArray in data:
  #print(componentArray, end="\n\n")
  for component in componentArray:
    print ("name: "     + component["name"])
    print ("inputs: "   , end="")
    print (component["inputs"], end="\n")
    print ("outputs: ", end="")
    print (component["outputs"], end="\n")
    print ("children: ", end="")
    print (component["children"], end="\n")
    print ("connections: ", end="")
    for conn in component["connections"]:
      print (conn, end="")
    print ("\n")
  
