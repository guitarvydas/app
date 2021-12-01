# component
## parameters
  Component
## imports
  fb
  shapes
  component_helper
## query
  isrect(R)
  das_fact(name,R,Name)
  ( hasport(R) ; (\+ hasport(R), hasnoparent(R), Inputs = []) )
  ( (hasport(R), inputs(R,Inputs)) ; (\+ hasport(R), Inputs = []) )
  Component = component{name:Name,inputs:Inputs}
  json_write(user_error,[Component],[width(128)])
## display
component_fact(component,\"${Component}\",\"\").

