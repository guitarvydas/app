const fs = require ('fs');
var rawText = fs.readFileSync ('/dev/fd/0');
var parameters = JSON.parse(rawText);
parameters.forEach (p => {
  var Codebox = p [0];
var Code = p [1];
  
if (true) { console.log (`das_fact(codebox,${Codebox},\"${Code}\").`);};
});
  
