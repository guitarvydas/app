vertices(VertexBag):-
    bagof(Vertex,notEllipse(Vertex),VertexBag).

notEllipse(V):-
    fact(vertex,V,1),
    \+isellipse(V).

edges(EdgeBag):-
    bagof(Edge,fact(edge,E,1),EdgeBag).

inferrect(R):-assertz(fact(kind,R,rectangle)).
inferedge(R):-assertz(fact(kind,R,edge)).


