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
  json_write(user_error,Source)
  nl(user_error)
  json_write(user_error,Target)
  nl(user_error)
  write(user_error,Source)
  nl(user_error)
  write(user_error,Target)
  nl(user_error)
## display
das_fact(connection, ${Parent}, ${Edge}).
das_fact(source, ${Edge}, source{component:${Source.component},port:${Source.port}}).
das_fact(source, ${Edge}, target{component:${Target.component},port:${Target.port}}).

