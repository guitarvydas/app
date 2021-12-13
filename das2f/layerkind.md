# layer kind
## parameters
  X
  Kind
## imports
  ~/app/das2f/shapes.pl
  ~/app/das2f/onSameDiagram.pl
  ~/app/das2f/inside.pl
  ~/app/das2f/names.pl
  ~/app/das2f/ports.pl
  ~/app/das2f/contains.pl
## forall X as diagram_fact(cell,X,_)
    Kind = cond
      diagram_fact(kind,X,"ellipse") "ellipse"
      diagram_fact(edge,X,1)         "edge"
      diagram_fact(root,X,1)         "root"
     else                            "rectangle"
## display
  das_fact(kind,${X},${Kind}).
