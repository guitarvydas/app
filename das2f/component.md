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
  ( hasport(R) ; (\+ hasport(R), hasnoparent(R), Inputs = [], Outputs = []) )
  ( (hasport(R), inputs(R,Inputs), outputs(R,Outputs)) ; fail )
  children(R,Children)
  Component = component{name:Name, inputs:Inputs, outputs:Outputs, children:Children}
  json_write(user_error,[Component],[width(128)])
## display
component_fact(component,\"${Component}\",\"\").

