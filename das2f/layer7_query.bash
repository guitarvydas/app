

temp=temp${RANDOM}
# component


cat >${temp}.pl <<'~~~'
:- use_module(library(http/json)).
?- consult(fb).
?- consult(shapes).
?- consult(component_helper).
query_helper(Name):-
isrect(R),
das_fact(name,R,Name),
( hasport(R) ; hasnoparent(R) ),
true.
query:-
bagof([Name],query_helper(Name),Bag),
json_write(user_output,Bag,[width(128)]).
~~~
cat >${temp}.js <<'~~~'
const fs = require ('fs');
var rawText = fs.readFileSync ('/dev/fd/0');
var parameters = JSON.parse(rawText);
parameters.forEach (p => {
  var Name = p [0];
  console.log(`[[component: ${Name}]]`);
});
~~~
swipl -g "consult(${temp})." -g 'query.' -g 'halt.' | node ${temp}.js
rm -f ${temp}.pl
rm -f ${temp}.js

