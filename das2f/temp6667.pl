:- use_module(library(http/json)).
?- consult(fb).
?- consult(shapes).
?- consult(onSameDiagram).
?- consult(inside).
?- consult(names).
?- consult(ports).
?- consult(contains).
query_helper(ID,Name):-
diagram_fact(vertex,ID,_),
diagram_fact(value,ID,Name),
true.
query:-
bagof([ID,Name],query_helper(ID,Name),Bag),
json_write(user_output,Bag,[width(128)]).
