transitivecontains(D,X):-fact(contains,D,X).
transitivecontains(D,X):-fact(contains,D,Y),fact(contains,Y,X).
