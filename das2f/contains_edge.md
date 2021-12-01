# contains edge
## parameters
  Rect
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
	das_fact(contains,Rect,Source)
## display
das_fact(contains,${Rect},${Edge}).
  
