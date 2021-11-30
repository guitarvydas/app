

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
query:-
setof([A,B],das_fact(contains,A,B),All),
setof([C,D],das_fact(indirect_contains,C,D),Indirect),
subtract(All,Indirect,Set),
json_write(user_output,Set,[width(128)]).
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
rm -f ${temp}.pl 1>&2
rm -f ${temp}.js 1>&2
