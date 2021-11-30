# contains port
## imports
    fb
    shapes
    onSameDiagram
    inside
    names
    ports
## setquery
	setof([A,B],fact(contains,A,B),All)
	setof([C,D],fact(indirect_contains,C,D),Indirect)
	subtract(All,Indirect,Set)
## display
das_fact(contains,${R},${E}).
  
