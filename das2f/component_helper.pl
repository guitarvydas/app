hasport(R):-
    das_fact(contains,R,P),
    isport(P),
    !.

isport(P):-
    isellipse(P).

hasnoparent(R):-
    isrect(R),
    \+ das_fact(contains,_,R).
