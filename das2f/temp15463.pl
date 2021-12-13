:- use_module(library(http/json)).
?- consult(fb).
?- consult("shapes.pl").
?- consult("onSameDiagram.pl").
?- consult("inside.pl").
?- consult("names.pl").
?- consult("ports.pl").
?- consult("contains.pl").
query_helper(ID,X,Y,Right,Bottom):-
diagram_fact(x,ID,X),
diagram_fact(y,ID,Y),
diagram_fact(width,ID,W),
diagram_fact(height,ID,H),
Right is X+W,
Bottom is Y+H,
true.
query:-
bagof([ID,X,Y,Right,Bottom],query_helper(ID,X,Y,Right,Bottom),Bag),
json_write(user_output,Bag,[width(128)]).
