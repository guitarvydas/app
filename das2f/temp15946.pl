:- use_module(library(http/json)).
?- consult(fb).
?- consult("~/app/das2f/shapes.pl.pl").
?- consult("~/app/das2f/onSameDiagram.pl.pl").
?- consult("~/app/das2f/inside.pl.pl").
?- consult("~/app/das2f/names.pl.pl").
?- consult("~/app/das2f/ports.pl.pl").
?- consult("~/app/das2f/contains.pl.pl").
query_helper(X,Kind):-
diagram_fact(cell,X,_),
(diagram_fact(kind,X,"ellipse")  -> Kind = "ellipse";diagram_fact(edge,X,1)  -> Kind = "edge";diagram_fact(root,X,1)  -> Kind = "root"; Kind = "rectangle"),
true.
query:-
bagof([X,Kind],query_helper(X,Kind),Bag),
json_write(user_output,Bag,[width(128)]).
