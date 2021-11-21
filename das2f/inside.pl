% succeeds only if B's bounding box is fully inside A's bounding box, inclusively
completelyInside(B,A):-
    fact(bbL,B,Bl),
    fact(bbT,B,Bt),
    fact(bbR,B,Br),
    fact(bbB,B,Bb),
    fact(bbL,A,Al),
    fact(bbT,A,At),
    fact(bbR,A,Ar),
    fact(bbB,A,Ab),
    Bl >= Al,
    Bl =< Ar,
    Br >= Al,
    Br =< Ar,
    Bt >= At,
    Bt =< Ab,
    Bb >= At,
    Bb =< Ab.
    
