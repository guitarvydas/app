# connection
## parameters
  Parent
  Edge
  Source
  Target
## imports
  fb
  shapes
  names
  connection
## query
  das_fact(kind,Edge,edge)
  sourceof(Edge,Source)
  targetof(Edge,Target)
  das_fact(direct_contains,Parent,Edge)
## display
das_fact(connection, ${Parent}, ${Edge}).
das_fact(source, ${Edge}, source${JSON.stringify(Source)}).
das_fact(target, ${Edge}, target${JSON.stringify (Target)}).

