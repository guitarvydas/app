# layer 3
## parameters
  ID
  X
  Y
  Right
  Bottom
## imports
  fb
    shapes
    onSameDiagram
    inside
    names
    ports
	contains
## query
    diagram_fact(x,ID,X)
    diagram_fact(y,ID,Y)
    diagram_fact(width,ID,W)
    diagram_fact(height,ID,H)
    Right is X+W
    Bottom is Y+H
## display
  das_fact(bbL,${ID},${X}).\ndas_fact(bbT,${ID},${Y}).\ndas_fact(bbR,${ID},${Right}).\ndas_fact(bbB,${ID},${Bottom}).
