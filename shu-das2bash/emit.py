
import json

with open('out.json') as f:
  data = json.load(f)

for componentArray in data:
  for component in componentArray:
    print ("name: "     + component["name"])
    print ("inputs: "   , end="")
    print (component["inputs"], end="\n")
    print ("outputs: ", end="")
    print (component["outputs"], end="\n")
    print ("children: ", end="")
    print (component["children"], end="\n")
    if (0 == len(component["connections"])):
      print ("connections: []", end="\n")
    else:
      print ("connections: ", end="\n")
      for conn in component["connections"]:
        print ("  ", end="")
        print (conn, end="\n")
    print ("\n")
  
