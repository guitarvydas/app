const fs = require ('fs');

// separators are based on lines
// #+ allows lines to be used in .md files (easily), e.g.
// ###~~~

let reBeginSeparator = /#+~~~/;
let reEndSeparator = /#+~~~/;

function splitOnSeparators (s) {
    // s = front + beginSep + middle + endSep + rest
    // if there is nothing to expand (i.e. no beginSep), s = front
    // return 3 parts, excluding beginSep and endSep

    var frontMatch = s.match (reBeginSeparator);
    if (frontMatch) {
        // s contains a begin separator : front + beginSep + middle + endSep + rest
	var indexEndFront = frontMatch.index;
	var front = s.substring (0, indexEndFront);

	// combined = middle + endSep + rest
	var combined = s.substring (indexEndFront + frontMatch.length);
	var middleMatch = combined.match (reEndSeparator);

	var middle = combined.substring (0, middleMatch.index);
	var rest = combined.substring (middleMatch.index + middleMatch.length);
	
	return { front, middle, rest };
    } else {
	// there is no middle nor rest (no beginSep)
	front = s;
	middle = '';
	rest = ''
	return { front, middle, rest }; // should be { s, '', '' }, but node.js balks
    }
}

function expandAll (s) {
    var {front, middle, rest} = splitOnSeparators (s);
    if (middle === '') {
	return front;
    } else {
	var expandedText = expand (middle);
	return front + expandAll (expandedText + rest);
    }
}

function main () {
    var allchars = fs.readFileSync ('/dev/fd/0', 'utf-8');
    console.error (`ALL:${allchars}\n\n`);
    var expanded = expandAll (allchars);
    emit (expanded);
}


function expand (s) {
    return s; // stub out for debug
}

function emit (s) {
    console.log (s);
}

main ();
