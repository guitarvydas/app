

temp=temp${RANDOM}
# contains edge


cat >${temp}.pl <<'~~~'
:- use_module(library(http/json)).
?- consult(fb).
?- consult(shapes).
?- consult(onSameDiagram).
?- consult(inside).
?- consult(names).
?- consult(ports).
query_helper(Rect,Edge):-
isrect(Rect),
isedge(Edge),
diagram_fact(source,Edge,SourceLongID),
diagram_fact(synonym,Source,SourceLongID),
das_fact(contains,Rect,Source),
true.
query:-
bagof([Rect,Edge],query_helper(Rect,Edge),Bag),
json_write(user_output,Bag,[width(128)]).
~~~
cat >${temp}.js <<'~~~'
const fs = require ('fs');
var rawText = fs.readFileSync ('/dev/fd/0');
var parameters = JSON.parse(rawText);
parameters.forEach (p => {
  var Rect = p [0];
var Edge = p [1];
  console.log(`das_fact(contains,${Rect},${Edge}).`);
});
~~~
swipl -g "consult(${temp})." -g 'query.' -g 'halt.' | node ${temp}.js
rm -f ${temp}.pl
rm -f ${temp}.js

