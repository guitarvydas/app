var parameterList = [];

exports.resetParameterList = function () {
    parameterList = [];
    return '';
}

exports.pushParameter = function (cFirst, cRest) {
    var ident = cFirst + cRest;
    parameterList.push (ident);
    return ident;
}

exports.constructParameters = function () {
    var counter = 0;
    var result = [];
    parameterList.forEach (ident => {
	result.push (`var ${ident} = param [${counter}];`);
	counter += 1;
    });
    return result.join ('\n');
}
