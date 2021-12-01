# component
## parameters
  Name
  Inputs
## imports
  fb
  shapes
  component_helper
## query
  isrect(R)
  das_fact(name,R,Name)
  ( hasport(R) ; hasnoparent(R) )
  ( hasport(R), inputs(R,Inputs) ; Inputs = [] )
  json_write(user_error,[Name, Inputs],[width(128)])
## display
component_fact(name,\"${Name}\").\ncomponent_fact(inputs,\"${Name}\",${Inputs}).

