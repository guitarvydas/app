onSameDiagram(A,B):-
    diagramContains(D,A),
    diagramContains(D,B).
    
diagramContains(D,X):-
    diagram(D,_),
    transitivecontains(D,X).

