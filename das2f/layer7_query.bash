

temp=temp${RANDOM}
# component


cat >${temp}.pl <<'~~~'
:- use_module(library(http/json)).
?- consult(fb).
?- consult(shapes).
?- consult(component_helper).
query_helper(Name,Inputs):-
isrect(R),
das_fact(name,R,Name),
( hasport(R) ; hasnoparent(R) ),
( hasport(R), inputs(R,Inputs) ; Inputs = [] ),
json_write(user_error,[Name, Inputs],[width(128)]),
true.
query:-
bagof([Name,Inputs],query_helper(Name,Inputs),Bag),
json_write(user_output,Bag,[width(128)]).
~~~
cat >${temp}.js <<'~~~'
const fs = require ('fs');
var rawText = fs.readFileSync ('/dev/fd/0');
var parameters = JSON.parse(rawText);
parameters.forEach (p => {
  var Name = p [0];
var Inputs = p [1];
  console.log(`component_fact(name,\"${Name}\").\ncomponent_fact(inputs,\"${Name}\",${Inputs}).`);
});
~~~
swipl -g "consult(${temp})." -g 'query.' -g 'halt.' | node ${temp}.js
rm -f ${temp}.pl
rm -f ${temp}.js

