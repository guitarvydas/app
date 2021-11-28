



inferLayer3:-
    bagof([X,Y],contains(X,Y),ContainsBag),
    assertFactsLayer3(ContainsBag).

displayLayer3Facts:-
    forall(das_fact(contains,X,K),format("das_fact(contains,~w,~q).~n",[X,K])).

layer3:-
    inferLayer3,
    displayLayer3Facts.

assertFactsLayer3([]).
assertFactsLayer3([[Parent,Child]|RestDirectContains]):-
    assertz(das_fact(contains,Parent,Child)),
    assertFactsLayer3(RestDirectContains).


