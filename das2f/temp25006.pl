:- use_module(library(http/json)).
?- consult(fb).
?- consult("~/app/das2f/shapes.pl").
?- consult("~/app/das2f/onSameDiagram.pl").
?- consult("~/app/das2f/inside.pl").
?- consult("~/app/das2f/names.pl").
?- consult("~/app/das2f/ports.pl").
?- consult("~/app/das2f/contains.pl").
query_helper(Parent,Child):-
contains(Parent,Child),
true.
query:-
bagof([Parent,Child],query_helper(Parent,Child),Bag),
json_write(user_output,Bag,[width(128)]).
