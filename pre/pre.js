const fs = require ('fs');

function old_main () {
    let re = /(.*)~~~(.*)/m;
    var allchars = fs.readFileSync ('/dev/fd/0', 'utf-8');
    console.log (`ALL:${allchars}\n\n`);
    var m = allchars.match (re);
//    var front = allchars.substring (0, index);
    var front = m?.[1];
//    var restBeginningWithRE = allchars.substring (front.length);
//    var index2 = restBeginningWithRE.match (re2);
    var rest = m?.[2];
    console.log (`WHOLE:${m?.[0]}\n\n`);
    console.log (`FRONT:${front}\n\n`);
    console.log (`REST:${rest}\n\n`);
}

function old_old_main () {
    let re = /#+~~~/;
    var allchars = fs.readFileSync ('/dev/fd/0', 'utf-8');
    console.log (`ALL:${allchars}\n\n`);
    var m = allchars.match (re);
    console.log(m);
}

function main () {
    let re = /#+~~~/;
    var allchars = fs.readFileSync ('/dev/fd/0', 'utf-8');
    console.log (`ALL:${allchars}\n\n`);
    var m = allchars.match (re);
    console.log(m);
    console.log(`index=${m.index} m[0]=${m[0]} len=${m[0].length}\n\n`);
}

main ();
