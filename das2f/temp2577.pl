:- use_module(library(http/json)).
?- consult(fb).
?- consult(shapes).
?- consult(onSameDiagram).
?- consult(inside).
?- consult(names).
?- consult(ports).
?- consult(contains).
query_helper(Parent,Child):-
diagram_fact(cell,X,_),
(
diagram_fact(kind,X,"ellipse")  -> Kind = "ellipse",
;,
diagram_fact(edge,X,1)          -> Kind = "edge",
;,
diagram_fact(root,X,1)          -> Kind = "root",
;,
Kind = "rectangle",
),
true.
query:-
bagof([Parent,Child],query_helper(Parent,Child),Bag),
json_write(user_output,Bag,[width(128)]).
