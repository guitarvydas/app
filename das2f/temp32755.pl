:- use_module(library(http/json)).
?- consult(fb).
?- consult("shapes").
?- consult("onSameDiagram").
?- consult("inside").
?- consult("names").
?- consult("ports").
?- consult("contains_port").
query_helper(R,E):-
das_fact(kind,R,rectangle),
das_fact(kind,E,ellipse),
containsport(R,E),
true.
query:-
bagof([R,E],query_helper(R,E),Bag),
json_write(user_output,Bag,[width(128)]).
