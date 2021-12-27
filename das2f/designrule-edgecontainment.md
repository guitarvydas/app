# design rule edge containment
%% use experimental editor https://ohmlang.github.io/editor/?ohm-js=next
## parameters
  Edge
## imports
  shapes
  onSameDiagram
  inside
  names
  ports
  contains
## rule
  %% see "doc/Design Rules.md"
  forall das_fact(kind,Edge,edge)
    diagram_fact(source,Edge,SourceLongID)
    diagram_fact(synonym,SourceID,SourceLongID)
    diagram_fact(target,Edge,TargetLongID)
    diagram_fact(synonym,TargetID,TargetLongID)
	diagram_fact(direct-contains,SourceParent,SourceID)
    diagram_fact(direct-contains,TargetParent,TargetID)
    diagram_fact(direct-contains,SourceContainer,SourceParent)
    diagram_fact(direct-contains,TargetContainer,TargetParent)
    cond 
      SourceContainer = TargetContainer
      das_fact(direct_contains,SourceContainer,TargetContainer)
      das_fact(direct_contains,TargetContainer,SourceContainer)
    end cond
end forall
## on failure
Edge Containment edge=${Edge}


	
