



inferLayer3:-
    direct_contains(DirectContainsSet),
    assertFactsLayer3(DirectContainsSet).

displayLayer3Facts:-
    forall(das_fact(direct_contains,X,K),format("das_fact(direct_contains,~w,~q).~n",[X,K])).

layer3:-
    inferLayer3,
    displayLayer3Facts.

assertFactsLayer3([]).
assertFactsLayer3([[Parent,Child]|RestDirectContains]):-
    assertz(das_fact(direct_contains,Parent,Child)),
    assertFactsLayer3(RestDirectContains).

indirect_contains(X,Y):-
    contains(X,Y),
    contains(X,A),
    contains(A,Y),
    X \= Y,
    X \= A,
    Y \= A.
indirect_contains(X,Y):-
    contains(X,Y),
    contains(X,A),
    \+ contains(A,Y),
    indirect_contains(A,Y),
    X \= Y,
    X \= A,
    Y \= A.

set_indirect_contains(Set):-
    setof([G,H],indirect_contains(G,H),Set).

set_contains(Set):-
    setof([J,K],contains(J,K),Set).

direct_contains(Direct):-
    set_indirect_contains(Indirect),
    set_contains(All),
    subtract(All,Indirect,Direct).

contains(X,Y):-
    diagram_fact(contains,X,Y).
contains(X,Y):-
    \+ diagram_fact(contains,X,Y),
    completelyInside(Y,X).


