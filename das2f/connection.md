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
  isedge(Edge)
  sourceof(Edge,Source)
  targetof(Edge,Target)
  das_fact(direct_contains,Parent,Edge)
  json_write(user_error,Source)
  json_write(user_error,Target)
## display
das_fact(connection, ${Parent}, ${Edge}).\ndas_fact(source, ${Edge}, [${Source}]).\ndas_fact(target, ${Edge}, [${Target}]).

