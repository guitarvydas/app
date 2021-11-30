

temp=temp${RANDOM}
# contains port

cat >${temp}.pl <<'~~~'
:- use_module(library(http/json)).
query:-
setof([A,B],fact(contains,A,B),All),
setof([C,D],fact(indirect_contains,C,D),Indirect),
subtract(All,Indirect,Set),
json_write(user_output,Set,[width(128)]).
~~~
cat >${temp}.js <<'~~~'
const fs = require ('fs');
var rawText = fs.readFileSync ('/dev/fd/0');
var parameters = JSON.parse(rawText);
parameters.forEach (p => {
  
  console.log(`das_fact(contains,${R},${E}).`);
});
~~~
swipl -g "consult(${temp})." -g 'query.' -g 'halt.' | node ${temp}.js
rm -f ${temp}.pl
rm -f ${temp}.js

