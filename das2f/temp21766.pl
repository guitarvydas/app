:- use_module(library(http/json)).
?- consult(fb).
?- consult("shapes.pl").
?- consult("names.pl").
?- consult("connection.pl").
query_helper(Parent,Edge,Source,Target):-
das_fact(kind,Edge,edge),
sourceof(Edge,Source),
targetof(Edge,Target),
das_fact(direct_contains,Parent,Edge),
true.
query:-
bagof([Parent,Edge,Source,Target],query_helper(Parent,Edge,Source,Target),Bag),
json_write(user_output,Bag,[width(128)]).
