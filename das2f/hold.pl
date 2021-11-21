
	      valueof(V,ValLong),
	      (sub_string(ValLong,_,32,_,Val),! ; Val = ValLong)

	      	      (fact(synonym,V,Syn),! ; Syn = V)

	      (fact(color,V,Clr) ; \+fact(color,V,_),Clr = "?"),
	      fact(bbL,V,L),
	      fact(bbT,V,T),
	      fact(bbR,V,R),
	      fact(bbB,V,B)
	      
	      (fact(synonym,V,Syn) ; \+fact(synonym,V,_),Syn = V),
