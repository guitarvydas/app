

temp=temp${RANDOM}
# contains port


cat >${temp}.pl <<'~~~'
:- use_module(library(http/json)).
?- consult(fb).
?- consult(shapes).
?- consult(onSameDiagram).
?- consult(inside).
?- consult(names).
?- consult(ports).
?- consult(contains_port).
query_helper(R,E):-
isrect(R),
isellipse(E),
contains_port(R,E),
true.
query:-
bagof([R,E],query_helper(R,E),Bag),
json_write(user_output,Bag,[width(128)]).
~~~
cat >${temp}.js <<'~~~'
const fs = require ('fs');
var rawText = fs.readFileSync ('/dev/fd/0');
var parameters = JSON.parse(rawText);
parameters.forEach (p => {
  var R = p [0];
var E = p [1];
  console.log(`das_fact(contains,${R},${E}).`);
});
~~~
swipl -g "consult(${temp})." -g 'query.' -g 'halt.' | node ${temp}.js

