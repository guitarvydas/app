

temp=temp${RANDOM}
# layer 3


cat >${temp}.pl <<'~~~'
:- use_module(library(http/json)).
?- consult(fb).
query_helper(Parent,Child):-
contains(Parent,Child),
true.
query:-
bagof([Parent,Child],query_helper(Parent,Child),Bag),
json_write(user_output,Bag,[width(128)]).
~~~
cat >${temp}.js <<'~~~'
const fs = require ('fs');
var rawText = fs.readFileSync ('/dev/fd/0');
var parameters = JSON.parse(rawText);
parameters.forEach (p => {
  var Parent = p [0];
var Child = p [1];
  console.log(`das_fact(contains,Parent,Child)`);
});
~~~
swipl -g "consult(${temp})." -g 'query.' -g 'halt.' | node ${temp}.js

