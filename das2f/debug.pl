debug1:-
    common,
    bagof([V,L,T,R,B,Clr],
	  (
	      fact(vertex,V,1),
	      (fact(color,V,Clr) ; \+fact(color,V,_),Clr = "?"),
	      fact(bbL,X,L),
	      fact(bbT,X,T),
	      fact(bbR,X,R),
	      fact(bbB,X,B)
	  ) ,Bag),
    json_write(user_output,Bag),
    nl.
