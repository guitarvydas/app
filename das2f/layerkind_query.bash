

temp=temp${RANDOM}
# layer kind


cat >${temp}.pl <<'~~~'
:- use_module(library(http/json)).
?- consult(fb).
?- consult("/shapes").
?- consult("/onSameDiagram").
?- consult("/inside").
?- consult("/names").
?- consult("/ports").
?- consult("/contains").
query_helper(X,Kind):-
diagram_fact(cell,X,_),
(diagram_fact(kind,X,"ellipse")  -> Kind = "ellipse";diagram_fact(edge,X,1)  -> Kind = "edge";diagram_fact(root,X,1)  -> Kind = "root"; Kind = "rectangle"),
true.
query:-
bagof([X,Kind],query_helper(X,Kind),Bag),
json_write(user_output,Bag,[width(128)]).
~~~
cat >${temp}.js <<'~~~'
const fs = require ('fs');
var rawText = fs.readFileSync ('/dev/fd/0');
var parameters = JSON.parse(rawText);
parameters.forEach (p => {
  var X = p [0];
var Kind = p [1];
  
if (true) { console.log (`das_fact(kind,${X},${Kind}).`);};
});
  
~~~
swipl -g "consult(${temp})." -g 'query.' -g 'halt.' | node ${temp}.js
rm -f ${temp}.pl
rm -f ${temp}.js

