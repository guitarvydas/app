const fs = require ('fs');
var rawText = fs.readFileSync ('/dev/fd/0');
var parameters = JSON.parse(rawText);
parameters.forEach (p => {
  var Parent = p [0];
var Child = p [1];
  
if (true) { console.log (`das_fact(indirect_contains,${Parent},${Child}).`);};
});
  
