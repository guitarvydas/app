# component

# query
  das_fact(contains,R,X)
# display


-------

connectionOf(C,connection{name:ConnectionName,source:pair{component:SourceName,port:SourcePort},target:pair{component:TargetName,port:TargetPort}}):-
    contains(C,E),
    edge(E,_),
    source(E,SC),
    componentname(SC,SourcePort),
    contains(SourceParent,SC),
    getname(SourceParent,SourceName),
    target(E,TC),
    componentname(TC,TargetPort),
    contains(TargetParent,TC),
    getname(TargetParent,TargetName),
    gensym(x,ConnectionName).
    
