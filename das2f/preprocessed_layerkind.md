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
## query
diagram_fact(cell,X,_) 
(diagram_fact(kind,X,"ellipse")  -> Kind = "ellipse";diagram_fact(edge,X,1)  -> Kind = "edge";diagram_fact(root,X,1)  -> Kind = "root"; Kind = "rectangle")
## display
  das_fact(kind,${X},${Kind}).

