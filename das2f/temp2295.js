const fs = require ('fs');
var rawText = fs.readFileSync ('/dev/fd/0');
var parameters = JSON.parse(rawText);
parameters.forEach (p => {
  var X = p [0];
var Kind = p [1];
  
if (true) { console.log (`das_fact(kind,${X},${Kind}).`);};
});
  
