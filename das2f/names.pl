inferName(V):-
    diagram_fact(vertex,ID,_),
    diagram_fact(synonym,V,ID),
    diagram_fact(value,ID,Name),
    assertz(das_fact(name,V,Name)).
inferName(V):-
    diagram_fact(vertex,V,_),
    diagram_fact(value,V,Name),
    assertz(das_fact(name,V,Name)).

nameof(ID,Name):-
    diagram_fact(name,ID,Name),
    \+ diagram_fact(color,ID,"red").
nameof(ID,"-"):-
    diagram_fact(color,ID,"red").
nameof(ID,Name):-
    \+ diagram_fact(name,ID,Name),
    ID = Name.
