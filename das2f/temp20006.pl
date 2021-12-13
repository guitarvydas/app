:- use_module(library(http/json)).
?- consult(fb).
?- consult("fb.pl").
?- consult("shapes.pl").
?- consult("onSameDiagram.pl").
?- consult("inside.pl").
query_helper(ID,Direction):-
diagram_fact(kind,ID,"ellipse"),
(das_fact(color, ID, "green")  -> Direction = input;das_fact(color, ID, "yellow")  -> Direction = output;das_fact(color, ID, "red")  -> Direction = pervasiveinput;das_fact(color, ID, "purple")  -> Direction = pervasiveoutput; Direction = "?"),
true.
query:-
bagof([ID,Direction],query_helper(ID,Direction),Bag),
json_write(user_output,Bag,[width(128)]).
