// registers
var fileName;
var componentName;
var childrenNames;
var inputNames;
var outputNames;

exports.resetRegisters = function () {
    fileName = "";
    componentName = "";
    childrenNames = "";
    inputNames = "";
    outputNames = "";
}

exports.fileNameSet = function (s) {
    fileName = s;
}

exports.componentNameSet = function (s) {
    componentName = s;
}

function deleteLeadingComma (s) {
    return s.replace (/, /, '');
}

exports.childrenNamesSet = function (s) {
    childrenNames = deleteLeadingComma (s);
}

exports.inputNamesSet = function (s) {
    inputNames = deleteLeadingComma (s);
}

exports.outputNamesSet = function (s) {
    inputNames = deleteLeadingComma (s);
}

exports.writeComponent = function () {
    console.error (`filename = ${fileName}`);
    console.error (`componentName = ${componentName}`);
    console.error (`childrenNames = [${childrenNames}]`);
    console.error (`inputNames = [${inputNames}]`);
    console.error (`outputNames = [${outputNames}]`);
    console.error ();
}
