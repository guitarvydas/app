sourceof(Edge, Source):-
    diagram_fact(source,Edge, SourceLongID),
    diagram_fact(synonym,Source,SourceLongID),
    !.
sourceof(Edge, Source):-
    diagram_fact(source, Edge, Source),
    !.
sourceof(Edge,_):-format(user_error,"FATAL no source for connection ~w~n",[Edge]).


targetof(Edge, Target):-
    diagram_fact(target, Edge, TargetLongID),
    diagram_fact(synonym,Target,TargetLongID),
    !.
targetof(Edge, Target):-
    diagram_fact(target, Edge, Target),
    !.
targetof(Edge,_):-format(user_error,"FATAL no target for connection ~w~n",[Edge]).
