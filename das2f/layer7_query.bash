

temp=temp${RANDOM}
# component


cat >${temp}.pl <<'~~~'
:- use_module(library(http/json)).
?- consult(fb).
?- consult(shapes).
?- consult(component_helper).
query_helper(Component):-
isrect(R),
das_fact(name,R,Name),
( hasport(R) ; (\+ hasport(R), hasnoparent(R), Inputs = []) ),
( (hasport(R), inputs(R,Inputs)) ; (\+ hasport(R), Inputs = []) ),
Component = component{name:Name,inputs:Inputs},
json_write(user_error,[Component],[width(128)]),
true.
query:-
bagof([Component],query_helper(Component),Bag),
json_write(user_output,Bag,[width(128)]).
~~~
cat >${temp}.js <<'~~~'
const fs = require ('fs');
var rawText = fs.readFileSync ('/dev/fd/0');
var parameters = JSON.parse(rawText);
parameters.forEach (p => {
  var Component = p [0];
  console.log(`component_fact(component,\"${Component}\",\"\").`);
});
~~~
swipl -g "consult(${temp})." -g 'query.' -g 'halt.' | node ${temp}.js
rm -f ${temp}.pl
rm -f ${temp}.js

