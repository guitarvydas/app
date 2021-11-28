contains(X,Y):-
    diagram_fact(contains,X,Y).
contains(X,Y):-
    completelyInside(Y,X),
    X \= Y,
    \+ diagram_fact(contains,X,Y).
%% contains(R,E):-
%%     isrect(R),
%%     isEllipse(E),
%%     ellipse_intersects_boundary_of_rect(E,R).
