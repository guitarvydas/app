inferKind(X):-
    fact(kind,X,"ellipse").
inferKind(X):-
    fact(edge,X,1),
    assertz(fact(kind,X,"edge")).
inferKind(X):-
    fact(vertex,X,1),
    \+fact(kind,X,"ellipse"),
    \+fact(kind,X,"edge"),
    assertz(fact(kind,X,"rectangle")).

inferBB(S):-
    fact(x,S,X),
    fact(y,S,Y),
    fact(width,S,W),
    fact(height,S,H),
    Right is X+W,
    Bottom is Y+H,
    assertz(fact(bbL,S,X)),
    assertz(fact(bbT,S,Y)),
    assertz(fact(bbR,S,Right)),
    assertz(fact(bbB,S,Bottom)).

inferColor(X):-
    fact(fillColor,X,"#d5e8d4"),
    assertz(fact(color,X,"green")).
inferColor(X):-
    fact(fillColor,X,"#fff2cc"),
    assertz(fact(color,X,"yellow")).
inferColor(X):-
    fact(fillColor,X, "#f8cecc"),
    assertz(fact(color,X,"red")).
inferColor(X):-
    fact(fillColor,X,"#9673A6"),
    assertz(fact(color,X,"purple")).
inferColor(X):-
    fact(vertex,X,1),
    \+hasColor(X),
    assertz(fact(color,X,"-")).

hasColor(X):-
    fact(fillColor,X,"#d5e8d4").
hasColor(X):-
    fact(fillColor,X,"#fff2cc").
hasColor(X):-
    fact(fillColor,X, "#f8cecc").
hasColor(X):-
    fact(fillColor,X,"#9673A6").


inferLayer1:-
    bagof(X,inferKind(X),_),
    bagof(X,inferBB(X),_),
    bagof(X,
	  (fact(vertex,X,1),inferColor(X)),
	  _),
    bagof(X,inferName(X),_).

displayLayer1Facts:-
    forall(fact(kind,X,K),format("fact(vkind,~w,~q).~n",[X,K])),
    forall(fact(bbL,X,K),format("fact(bbL,~w,~q).~n",[X,K])),
    forall(fact(bbT,X,K),format("fact(bbT,~w,~q).~n",[X,K])),
    forall(fact(bbR,X,K),format("fact(bbR,~w,~q).~n",[X,K])),
    forall(fact(bbB,X,K),format("fact(bbB,~w,~q).~n",[X,K])),
    forall(fact(color,X,K),format("fact(color,~w,~q).~n",[X,K])).

makeLayer1:-
    consult(names),
    inferLayer1,
    displayLayer1Facts.


    
