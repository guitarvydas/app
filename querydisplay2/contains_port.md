# contains port
## parameters
  R
  E
## imports
    fb
    shapes
    onSameDiagram
    inside
    names
    ports
## query
    isrect(R)
    isEllipse(E)
	contains_port(R,E)
## display
das_fact(contains,${R},${E}).
  
