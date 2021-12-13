:- use_module(library(http/json)).
?- consult(fb).
?- consult("shapes.pl").
?- consult("values.pl").
query_helper(Codebox,Code):-
das_fact(kind,Codebox,rectangle),
das_fact(color,Codebox,"red"),
valueof(Codebox,Code),
true.
query:-
bagof([Codebox,Code],query_helper(Codebox,Code),Bag),
json_write(user_output,Bag,[width(128)]).
