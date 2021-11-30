:- use_module(library(http/json)).
?- consult(fb).
query_helper(Parent,Child):-
contains(Parent,Child),
true.
query:-
bagof([Parent,Child],query_helper(Parent,Child),Bag),
json_write(user_output,Bag,[width(128)]).
