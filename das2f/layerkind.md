# layer kind
## parameters
  Parent
  Child
## imports
  fb
  shapes
  onSameDiagram
  inside
  names
  ports
  contains
##~~~
  forall X matching diagram_fact(cell,X,_)
  cond Kind
      diagram_fact(kind,X,"ellipse") "ellipse"
      diagram_fact(edge,X,1)         "edge"
      diagram_fact(root,X,1)         "root"
     else                            "rectangle"
##~~~
## display
  das_fact(kind,${Vertex},${Kind}).
