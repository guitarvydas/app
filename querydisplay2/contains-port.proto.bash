query=q_${RANDOM}
display=d_${RANDOM}

cat >${query}.pl <<'~~~'
query_helper(R,E):-
  consult(fb),	
  consult(shapes).
  consult(onSameDiagram).
  consult(inside).
  consult(names).
  consult(ports).
  isrect(R),
  isEllipse(E),
  ellipse_intersects_boundary_of_rect(E,R).

query:-
  bagof([R,E],query(R,E),Bag),
  json_write(user_output,Bag,[width(128)]).
~~~

cat >${display}.js <<'~~~'
const fs = require ('fs');
var rawText = fs.readFileSync ('/dev/fd/0');
var parameters = JSON.parse(rawText);
parameters.forEach (param => {
    var R = param [0];
    var E = param [1];
    console.log(`das_fact(contains,${R},${E}).`);
});
~~~	     

swipl -g "consult(${query})." -g 'query.' -g 'halt.' | node ${display}
