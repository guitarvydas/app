// registers
var fileName;
var componentName;

exports.resetRegisters = function () {
    fileName = "";
    componentName = "";
    return "";
}

exports.fileNameSet = function (s) {
    fileName = s;
    return "";
}

exports.componentNameSet = function (s) {
    componentName = s;
    return "";
}

exports.writeComponent = function () {
    console.error (`filename = ${fileName}`);
    console.error (`componentName = ${componentName}`);
    console.error ();
}
