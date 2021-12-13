:- use_module(library(http/json)).
?- consult(fb).
?- consult("shapes").
?- consult("onSameDiagram").
?- consult("inside").
?- consult("names").
?- consult("ports").
query_helper(Parent,Child):-
das_fact(contains,Parent,X),
das_fact(contains,X,Child),
true.
query:-
bagof([Parent,Child],query_helper(Parent,Child),Bag),
json_write(user_output,Bag,[width(128)]).
