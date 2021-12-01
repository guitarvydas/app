hasport(R):-
    das_fact(contains,R,P),
    isport(P),
    !.

isport(P):-
    isellipse(P).

hasnoparent(R):-
    isrect(R),
    \+ das_fact(contains,_,R).

inputs(R,Inputs):-
    bagof(In, inputof(R,In), Inputs).

inputof(R,In):-
    isrect(R),
    das_fact(direction,InputID,input),
    das_fact(direct_contains,R,InputID),
    das_fact(name,InputID,In).
