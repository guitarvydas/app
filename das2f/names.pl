inferName(V):-
    fact(vertex,ID,_),
    fact(synonym,V,ID),
    fact(value,ID,Name),
    assertz(fact(name,V,Name)).
inferName(V):-
    fact(vertex,V,_),
    fact(value,V,Name),
    assertz(fact(name,V,Name)).

nameof(ID,Name):-
    fact(name,ID,Name),
    \+ fact(color,ID,"red").
nameof(ID,"-"):-
    fact(color,ID,"red").
nameof(ID,Name):-
    \+ fact(name,ID,Name),
    ID = Name.
