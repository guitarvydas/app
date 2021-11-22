:- dynamic fact/3.

inferPort(X):-
    fact(kind,X,"ellipse"),
    fact(color,X,"green"),
    assertz(fact(inputport,X,"-")).
inferPort(X):-
    fact(kind,X,"ellipse"),
    fact(color,X,"yellow"),
    assertz(fact(outputport,X,"-")).
inferPort(X):-
    fact(kind,X,"ellipse"),
    fact(color,X,"purple"),
    assertz(fact(pervasiveoutputport,X,"-")).
inferPort(X):-
    fact(kind,X,"ellipse"),
    fact(color,X,"red"),
    assertz(fact(pervasiveinputport,X,"-")).

portHasDirection(X):-
    fact(inputport,X,_).
portHasDirection(X):-
    fact(outputport,X,_).
portHasDirection(X):-
    fact(pervasiveinputport,X,_).
portHasDirection(X):-
    fact(pervasiveoutputport,X,_).

inferPortDirections:-
    bagof(X,(fact(kind,X,"ellipse"),inferPort(X)),_).

designRulePortsHaveDirection:-
    forall(fact(kind,X,"ellipse"),
	   checkHasDirection(X)).
