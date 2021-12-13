:- use_module(library(http/json)).
?- consult(fb).
?- consult("shapes.pl").
?- consult("onSameDiagram.pl").
?- consult("inside.pl").
?- consult("names.pl").
?- consult("ports.pl").
query_helper(Parent,Edge):-
das_fact(kind,Parent,rectangle),
das_fact(kind,Edge,edge),
diagram_fact(source,Edge,SourceLongID),
diagram_fact(synonym,Source,SourceLongID),
das_fact(direct_contains,Rect,Source),
das_fact(direct_contains,Parent,Rect),
true.
query:-
bagof([Parent,Edge],query_helper(Parent,Edge),Bag),
json_write(user_output,Bag,[width(128)]).
