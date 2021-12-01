

temp=temp${RANDOM}
# connection


cat >${temp}.pl <<'~~~'
:- use_module(library(http/json)).
?- consult(fb).
?- consult(shapes).
?- consult(names).
?- consult(connection).
query_helper(Parent,Edge,Source,Target):-
isedge(Edge),
format(user_error,"a~n",[]),
sourceof(Edge,Source),
format(user_error,"b~n",[]),
targetof(Edge,Target),
format(user_error,"c~n",[]),
das_fact(direct_contains,Parent,Edge),
format(user_error,"d ~w ~w~n",[Parent, Edge]),
json_write(user_error,Source),
json_write(user_error,Target),
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
  console.log(`das_fact(connection, ${Parent}, ${Edge}).\ndas_fact(source, ${Edge}, [${Source}]).\ndas_fact(target, ${Edge}, [${Target}]).`);
});
~~~
swipl -g "consult(${temp})." -g 'query.' -g 'halt.' | node ${temp}.js
rm -f ${temp}.pl
rm -f ${temp}.js

