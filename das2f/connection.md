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
das_fact(connection, ${Parent}, ${Edge}).\ndas_fact(source, ${Edge}, [${Source}]).\ndas_fact(target, ${Edge}, [${Target}]).

