const fs = require ('fs');
var rawText = fs.readFileSync ('/dev/fd/0');
var parameters = JSON.parse(rawText);
parameters.forEach (p => {
  var Parent = p [0];
var Edge = p [1];
var Source = p [2];
var Target = p [3];
  
if (true) { console.log (`das_fact(connection, ${Parent}, ${Edge}).
das_fact(source, ${Edge}, source{component:${Source.component},port:${Source.port}}).
das_fact(target, ${Edge}, target{component:${Target.component},port:${Target.port}}).`);};
});
  
