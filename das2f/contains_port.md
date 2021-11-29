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
    contains_port
## query
    isrect(R)
    isellipse(E)
    contains_port(R,E)
## display
das_fact(contains,${R},${E}).
  
