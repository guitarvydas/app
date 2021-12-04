const fs = require ('fs');
var rawText = fs.readFileSync ('/dev/fd/0');
var parameters = JSON.parse(rawText);
parameters.forEach (p => {
  var ID = p [0];
var X = p [1];
var Y = p [2];
var Right = p [3];
var Bottom = p [4];
  console.log(`das_fact(bbL,${ID},${X}).\ndas_fact(bbT,${ID},${Y}).\ndas_fact(bbR,${ID},${Right}).\ndas_fact(bbB,${ID},${Bottom}).`);
});
