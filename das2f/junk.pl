cond0(Passed,Edge):-
    ((diagram_fact(source,Edge,SourceLongID),
      diagram_fact(synonym,SourceID,SourceLongID),
      diagram_fact(target,Edge,TargetLongID),
      diagram_fact(synonym,TargetID,TargetLongID),
      das_fact(direct_contains,SourceContainer,SourceID),
      das_fact(direct_contains,TargetContainer,TargetID),
      (UberSource=UberTarget
      ;( das_fact(  direct_contains,UberTarget,TargetContainer  ),das_fact(  direct_contains,SourceContainer,UberTarget  ) )
      ;( das_fact(  direct_contains,UberSource,SourceContainer  ),das_fact(  direct_contains,TargetContainer,UberSource  ) )
      ;fail)
      ,
      true)->Passed=true ; Passed=false).

