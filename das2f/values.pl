valueof(X,Val):-
    fact(value,X,Val).
valueof(X,Val):-
    \+ fact(value,X,_),
    Val = "-".
