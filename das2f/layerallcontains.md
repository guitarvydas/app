# layer 3
## parameters
  Parent
  Child
## imports
    ~/app/das2f/shapes.pl
    ~/app/das2f/onSameDiagram.pl
    ~/app/das2f/inside.pl
    ~/app/das2f/names.pl
    ~/app/das2f/ports.pl
	~/app/das2f/contains.pl
## query
  contains(Parent,Child)
## display
  das_fact(contains,${Parent},${Child}).
