
inferLayer3:-
    direct_contains(DirectContainsSet),
    asserFactsLayer3(DirectContainsSet).

displayLayer3Facts:-
    forall(das_fact(direct_contains,X,K),format("das_fact(direct_contains,~w,~q).~n",[X,K])).

layer3:-
    inferLayer3,
    displayLayer3Facts.



assertFactsLayer3([]).
assertFactsLayer3([[Parent,Child]|RestDirectContains]):-
    assertz(das_fact(direct_contains,Parent,Child)),
    assertFactsLayer3(RestDirectContains).

    
    
