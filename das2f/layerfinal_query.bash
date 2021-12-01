

temp=temp${RANDOM}
# component


cat >${temp}.pl <<'~~~'
:- use_module(library(http/json)).
?- consult(fb).
?- consult(shapes).
?- consult(component_helper).
?- consult(code).
query_helper(Component):-
isrect(RID),
das_fact(name,RID,Name),
( hasport(RID) ; (\+ hasport(RID), hasnoparent(RID), Inputs = [], Outputs = []) ),
( (hasport(RID), inputs(RID,Inputs), outputs(RID,Outputs)) ; fail ),
children(RID,Children),
codeof(RID,Code),
Component = component{id:RID, name:Name, inputs:Inputs, outputs:Outputs, children:Children, code:Code},
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

