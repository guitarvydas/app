rectangleContains(R,V):-
    fact(rectangle,R),
    fact(vertex,V),
    completelyInside(V,R).
