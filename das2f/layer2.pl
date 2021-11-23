inferLayer2:-
    bagof(X,inferName(X),_).

generateLayer2Facts:-
    forall(das_fact(name,X,K),format("das_fact(name,~w,~q).~n",[X,K])).

makeLayer2:-
    consult(names),
    inferLayer2,
    generateLayer2Facts.




    
    
