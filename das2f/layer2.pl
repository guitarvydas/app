inferLayer2:-
    bagof(X,inferName(X),_).

generateLayer2Facts:-
    forall(fact(name,X,K),format("fact(name,~w,~q).~n",[X,K])).

makeLayer2:-
    consult(names),
    inferLayer2,
    generateLayer2Facts.


    
