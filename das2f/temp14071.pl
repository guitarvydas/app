:- use_module(library(http/json)).
?- consult(fb).
?- consult("shapes.pl").
?- consult("onSameDiagram.pl").
?- consult("inside.pl").
?- consult("names.pl").
?- consult("ports.pl").
?- consult("contains_port.pl").
query_helper(R,E):-
das_fact(kind,R,rectangle),
das_fact(kind,E,ellipse),
containsport(R,E),
true.
query:-
bagof([R,E],query_helper(R,E),Bag),
json_write(user_output,Bag,[width(128)]).
