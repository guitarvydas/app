# layer 3
## parameters
  Parent
  Child
## imports
    '/Users/tarvydas/app/das2f/shapes.pl'
    '/Users/tarvydas/app/das2f/onSameDiagram.pl'
    '/Users/tarvydas/app/das2f/inside.pl'
    '/Users/tarvydas/app/das2f/names.pl'
    '/Users/tarvydas/app/das2f/ports.pl'
	'/Users/tarvydas/app/das2f/contains.pl'
## query
  contains(Parent,Child)
## display
  das_fact(contains,${Parent},${Child}).
