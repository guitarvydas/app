:- dynamic fact/3.
:- use_module(library(http/json)).

common:-
    consult(fb),
    consult(shapes),
    consult(onSameDiagram),
    consult(inside),
    consult(names).


