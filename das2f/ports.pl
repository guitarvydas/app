inferPort(X):-
    diagram_fact(kind,X,"ellipse"),
    diagram_fact(color,X,"green"),
    assertz(das_fact(inputport,X,"-")).
inferPort(X):-
    diagram_fact(kind,X,"ellipse"),
    diagram_fact(color,X,"yellow"),
    assertz(das_fact(outputport,X,"-")).
inferPort(X):-
    diagram_fact(kind,X,"ellipse"),
    diagram_fact(color,X,"purple"),
    assertz(das_fact(pervasiveoutputport,X,"-")).
inferPort(X):-
    diagram_fact(kind,X,"ellipse"),
    diagram_fact(color,X,"red"),
    assertz(das_fact(pervasiveinputport,X,"-")).

portHasDirection(X):-
    das_fact(inputport,X,_).
portHasDirection(X):-
    das_fact(outputport,X,_).
portHasDirection(X):-
    das_fact(pervasiveinputport,X,_).
portHasDirection(X):-
    das_fact(pervasiveoutputport,X,_).

inferPortDirections:-
    bagof(X,(diagram_fact(kind,X,"ellipse"),inferPort(X)),_).

designRulePortsHaveDirection:-
    forall(diagram_fact(kind,X,"ellipse"),
	   checkHasDirection(X)).
