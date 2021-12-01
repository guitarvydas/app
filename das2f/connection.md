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
format(user_error,"a~n",[])
  sourceof(Edge,Source)
format(user_error,"b~n",[])
  targetof(Edge,Target)
format(user_error,"c~n",[])
  das_fact(direct_contains,Parent,Edge)
format(user_error,"d ~w ~w~n",[Parent, Edge])
  json_write(user_error,Source)
  json_write(user_error,Target)
## display
das_fact(connection, ${Parent}, ${Edge}).\ndas_fact(source, ${Edge}, [${Source}]).\ndas_fact(target, ${Edge}, [${Target}]).

