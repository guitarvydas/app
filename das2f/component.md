# component
## parameters
  Component
## imports
  fb
  shapes
  component_helper
  code
## query
  isrect(RID)
  das_fact(name,RID,Name)
  ( hasport(RID) ; (\+ hasport(RID), hasnoparent(RID), Inputs = [], Outputs = []) )
  ( (hasport(RID), inputs(RID,Inputs), outputs(RID,Outputs)) ; fail )
  children(RID,Children)
  codeof(RID,Code)
  Component = component{id:RID, name:Name, inputs:Inputs, outputs:Outputs, children:Children, code:Code}
  json_write(user_error,[Component],[width(128)])
## display
component_fact(component,\"${Component}\",\"\").

