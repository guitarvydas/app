:- use_module(library(http/json)).
query:-
setof([A,B],fact(contains,A,B),All),
setof([C,D],fact(indirect_contains,C,D),Indirect),
subtract(All,Indirect,Set),
json_write(user_output,Set,[width(128)]).
