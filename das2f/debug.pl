:- dynamic fact/3.
:- use_module(library(http/json)).


debug1:-
    debug1b.

debug1b:-
    % from common.pl but using vfb.pl instead of fb.pl
    consult(vfb),
    consult(shapes),
    consult(values),
    consult(names),
    consult(layer1),
    inferLayer1,
    setof([Name, Kind, Clr, L,T,R,B, V,Syn,Val],
	  (
	      ( fact(kind,V,"edge"),
		Kind = "edge",
		Val  = "-",
		L = "-", T = "-", R = "-", B = "-", Clr = "-", Syn = "-",
		Name = "-"
	      )
	      ;
	      (
		  fact(vertex,V,1),
		  (fact(color,V,Clr) ; \+fact(color,V,_),Clr = "?"),
		  fact(bbL,V,L),
		  fact(bbT,V,T),
		  fact(bbR,V,R),
		  fact(bbB,V,B),
		  fact(kind,V,Kind),
		  Val = "_",
		  fact(synonym,V,Syn),
		  nameof(V,Name)
	      )
	  ) ,Bag),
    json_write(user_output,Bag,[width(256)]),
    nl.

debug2b:-
    % from common.pl but using vfb.pl instead of fb.pl
    consult(vfb),
    consult(shapes),
    consult(names),
    setof([contains, Parent, Child, ParentID, ChildID],
	  (
	      (
		  fact(contains,ParentID,ChildID),
		  nameof(ParentID,Parent),
		  Child = "?1"
	      )
	  ;
	      (
		  fact(contains,ParentID,ChildID),
		  Parent = "?2",
		  Child = "?2"
              )
	  ) ,Bag),
    json_write(user_output,Bag),
    nl.
debug2a:-
    % from common.pl but using vfb.pl instead of fb.pl
    consult(vfb),
    consult(shapes),
    consult(names),
    setof([name, ID, Name],
	  fact(name,ID,Name)
	  ,Bag),
    json_write(user_output,Bag),
    nl.

debug2z:-
    % from common.pl but using vfb.pl instead of fb.pl
    consult(vfb),
    consult(shapes),
    consult(names),
    setof([F,ID,O],
	  (
	      ( ID = cell_13,fact(synonym,ID,Syn),fact(F,Syn,O) )
	  ;
	      ( ID = cell_13,                     fact(F,ID,O) )
	  ;
	      ( ID = "-", F = "-", O = "-")
	  )
	  ,Bag),
    json_write(user_output,Bag,[width(256)]),
    nl.

debug2:- debug2z.
