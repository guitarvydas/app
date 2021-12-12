:- use_module(library(http/json)).
?- consult(fb).
?- consult(shapes).
?- consult(onSameDiagram).
?- consult(inside).
?- consult(names).
?- consult(ports).
?- consult(contains).
query_helper(ID,Color):-
diagram_fact(cell,ID,_),
(diagram_fact(fillColor, ID, "#d5e8d4")  -> Color = "green";diagram_fact(fillColor, ID, "#fff2cc")  -> Color = "yellow";diagram_fact(fillColor, ID, "#f8cecc")  -> Color = "red";diagram_fact(fillColor, ID, "#9673A6")  -> Color = "purple"; Color = "-"),
true.
query:-
bagof([ID,Color],query_helper(ID,Color),Bag),
json_write(user_output,Bag,[width(128)]).
