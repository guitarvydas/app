

temp=temp${RANDOM}
# connection


cat >${temp}.pl <<'~~~'
:- use_module(library(http/json)).
?- consult(fb).
?- consult("/Users/tarvydas/app/das2f/shapes").
?- consult("/Users/tarvydas/app/das2f/names").
?- consult("/Users/tarvydas/app/das2f/connection").
query_helper(Parent,Edge,Source,Target):-
das_fact(kind,Edge,edge),
sourceof(Edge,Source),
targetof(Edge,Target),
das_fact(direct_contains,Parent,Edge),
true.
query:-
bagof([Parent,Edge,Source,Target],query_helper(Parent,Edge,Source,Target),Bag),
json_write(user_output,Bag,[width(128)]).
~~~
cat >${temp}.js <<'~~~'
const fs = require ('fs');
var rawText = fs.readFileSync ('/dev/fd/0');
var parameters = JSON.parse(rawText);
parameters.forEach (p => {
  var Parent = p [0];
var Edge = p [1];
var Source = p [2];
var Target = p [3];
  
if (true) { console.log (`das_fact(connection, ${Parent}, ${Edge}).
das_fact(source, ${Edge}, source{component:${Source.component},port:${Source.port}}).
das_fact(target, ${Edge}, target{component:${Target.component},port:${Target.port}}).`);};
});
  
~~~
swipl -g "consult(${temp})." -g 'query.' -g 'halt.' | node ${temp}.js
rm -f ${temp}.pl
rm -f ${temp}.js

