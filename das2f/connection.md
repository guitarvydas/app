# connection
## parameters
  Parent
  Edge
  Source
  Target
## imports
  fb
  shapes
  connection
## query
  isedge(Edge)
  sourceof(Edge,Source)
  targetof(Edge,Target)
  das_fact(direct_contains,Parent,Edge)
## display
das_fact(connection, ${Parent}, ${Edge}).\ndas_fact(source, ${Edge}, ${Source}).\ndas_fact(target, ${Edge}, ${Target}).

