# component
## parameters
  Name
## imports
  fb
  shapes
  component_helper
## query
  isrect(R)
  das_fact(name,R,Name)
  ( hasport(R) ; hasnoparent(R) )
## display
component_fact(\"${Name}\").
