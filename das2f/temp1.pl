:- use_module(library(http/json)).

qd:-
consult(common),
    bagof([Name, Kind, Clr, L,T,R,B, V,Syn,Val],
	  (
	      ( das_fact(kind,V,"edge"),
		Kind = "edge",
		Val  = "-",
		L = "-", T = "-", R = "-", B = "-", Clr = "-", Syn = "-",
		Name = "-"
	      )
	      ;
	      (
		  diagram_fact(vertex,V,1)
		  %,Val="-"
		  ,das_fact(color,V,Clr)
		  ,das_fact(bbL,V,L)
		  ,das_fact(bbT,V,T)
		  ,das_fact(bbR,V,R)
		  ,das_fact(bbB,V,B)
		  ,das_fact(kind,V,Kind)
		  %,diagram_fact(value,V,Long),sub_string(Long,0,1,_,Val)
		  ,diagram_fact(value,V,Val)
		  ,diagram_fact(synonym,V,Syn)
		  ,nameof(V,Name)
	      )
	  ) ,Bag),
	  json_write(user_output,Bag)

.
