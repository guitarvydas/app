# connection
## parameters
  Parent
  Edge
  Source
  Target
## imports
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
das_fact(source, ${Edge}, source{component:${Source.component},port:${Source.port}}).
das_fact(target, ${Edge}, target{component:${Target.component},port:${Target.port}}).

