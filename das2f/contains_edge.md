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
    isedge(Edge)
    das_fact(source,Edge,SourceLongID)
	das_fact(synonym,Source,SourceLongID)
	contains(Parent,Source)
## display
das_fact(contains,${Parent},${Edge}).
  
