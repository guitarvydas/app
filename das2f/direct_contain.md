# contains port
## parameters
  R
  X
## imports
    fb
    shapes
    onSameDiagram
    inside
    names
    ports
	direct_contains
## query
    isrect(R)
    (isrect (X) ; isellipse(X))
    direct_contains(R,X)
## display
das_fact(contains,${R},${X}).
  
