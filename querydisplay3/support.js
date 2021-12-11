var parameterArray = [];

exports.formatParameters = function () {
    return parameterArray.join (',');
}

exports.clearParameters = function () {
    parameterArray = [];
}

exports.pushParameter = function (s) {
    parameterArray.push (s.trim ());
    return '';
}

exports.formatJSParameters = function () {
    var counter = 0;
    var result = [];
    parameterArray.forEach (ident => {
	result.push (`var ${ident} = p [${counter}];`);
	counter += 1;
    });
    return result.join ('\n');
}


var conddisplayStack = []; // { predicate, then-lines-as-string }

exports.formatConditionalDisplays = function () {
    var result = '';
    var elseif = 'if';
    conddisplayStack.forEach (cond => {
	result = `${result}\n${elseif} (${cond.predicate}) { console.log (\`${cond.then}\`);}`;
	elseif = 'else if';
    });
    return result;
}

exports.pushConditionalDisplay = function (predicateString, thenString) {
    conddisplayStack.push ({predicate: predicateString.trim (), then: thenString.trim ()});
    return "";
}

    
