// registers
var fileName;
var componentName;
var childrenNames;
var inputNames;
var outputNames;
var idName;
var syncCode;

var nameStack = [];

exports.resetRegisters = function () {
    fileName = "";
    componentName = "";
    childrenNames = "";
    inputNames = "";
    outputNames = "";
    idName = "";
    syncCode = "";
    nameStack = [];
}

exports.namesPushNew = function () {
    nameStack.push ([]);
}

exports.namesDup = function () {
    let topList = nameStack.pop ();
    nameStack.push (topList);
    nameStack.push (topList);
}

exports.namesAdd = function (s) {
    let topList = nameStack.pop ();
    topList.push (s);
    nameStack.push (topList);
}

function popNames () {
    return nameStack.pop ();
}


exports.fileNameSet = function (s) {
    fileName = popNames ();
}

exports.componentNameSet = function (s) {
    componentName = popNames ();
}

exports.childrenNamesSet = function (s) {
    childrenNames = popNames ();
}

exports.inputNamesSet = function (s) {
    inputNames = popNames ();
}

exports.outputNamesSet = function (s) {
    inputNames = popNames ();
}

exports.idNameSet = function (s) {
    idName = popNames ();
}

exports.syncCodeSet = function (s) {
    syncCode = popNames ();
}

exports.writeComponent = function () {
    console.error (`filename      = ${fileName}`);
    console.error (`componentName = ${componentName}`);
    console.error (`id            = ${idName}`);
    console.error (`childrenNames = [${childrenNames}]`);
    console.error (`inputNames    = [${inputNames}]`);
    console.error (`outputNames   = [${outputNames}]`);
    console.error (`sync code     = ${syncCode}`);
    console.error ();
}
