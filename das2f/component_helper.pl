hasport(R):-
    das_fact(contains,R,P),
    isport(P),
    !.

isport(P):-
    isellipse(P).

hasnoparent(R):-
    isrect(R),
    \+ das_fact(contains,_,R).

inputs(R,Inputs):-
    bagof(In, inputof(R,In), Inputs),!.
inputs(_,[]).

inputof(R,In):-
    isrect(R),
    das_fact(direction,InputID,input),
    das_fact(direct_contains,R,InputID),
    nameof(InputID,In).
    
nameof(ID,Name):-
    das_fact(name,ID,Name).

outputs(R,Outputs):-
    bagof(In, outputof(R,In), Outputs),!.
outputs(_,[]).

outputof(R,Out):-
    isrect(R),
    das_fact(direction,OutputID,output),
    das_fact(direct_contains,R,OutputID),
    nameof(OutputID,Out).


children(R,Children):-bagof(Child,childof(R,Child),Children),!.
children(_,[]).

childof(R,ChildID):-
    isrect(R),
    isrect(ChildID),
    das_fact(direct_contains,R,ChildID),
    iscomponent(ChildID).
%    nameof(ChildID,Child).

iscomponent(X):-
    isrect(X),
    hasport(X),
    \+ iscode(X).

iscode(X):-
    issynccode(X).

issynccode(X):-
    isrect(X),
    \+ hasport(X),
    das_fact(color,X,"red").
