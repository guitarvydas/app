const fs = require ('fs');
var rawText = fs.readFileSync ('/dev/fd/0');
var parameters = JSON.parse(rawText);
parameters.forEach (p => {
  var ID = p [0];
var Color = p [1];
  
if (true) { console.log (`das_fact(color,${ID},\"${Color}\").`);};
});
  
