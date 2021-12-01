# contains edge
## parameters
  Parent
  Edge
## imports
    fb
    shapes
    onSameDiagram
    inside
    names
    ports
## query
    isrect(Rect)
    isedge(Edge)
    diagram_fact(source,Edge,SourceLongID)
	diagram_fact(synonym,Source,SourceLongID)
	das_fact(direct_contains,Rect,Source)
	das_fact(direct_contains,Parent,Rect)
## display
das_fact(direct_contains,${Parent},${Edge}).
  
