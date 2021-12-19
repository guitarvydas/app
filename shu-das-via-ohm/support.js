// registers
var fileName;
var componentName;
var childrenNames;
var inputNames;
var outputNames;
var idName;
var syncCode;
var sender;
var receiver;
var receiverList;
var connection;
var pair;

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

exports.senderNew = function () {
    sender = {};
}

exports.senderSet = function () {
    sender = pair;
}

exports.receiverNew = function () {
    receiver = {};
}

exports.receiverSet = function () {
    receiver = pair;
}

exports.receiverListNew = function () {
    receiverList = [];
}

exports.receiverListAdd = function () {
    topReceiver = receiverList.pop ();
    topReceiver.push (receiver);
    receiverList.push (topReceiver);
}

exports.connectionNew = function () {
    connection = [];
}

exports.pairNew = function () {
    pair = [];
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

