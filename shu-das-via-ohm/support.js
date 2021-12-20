// stacks
let senderOrReceiverStack = [];
let senderStack = [];
let receiverStack = [];
let pairStack = [];
let namesListStack = [];
let nameStack = [];
let connectionStack = [];
let connectionListStack = [];
let inputsFieldStack = [];
let outputsFieldStack = [];
let stringStack = [];
let syncCodeFieldStack = [];
let nameFieldStack = [];
let idFieldStack = [];
let connectionsFieldStack = [];
let childrenFieldStack = [];
let componentFieldStack = [];
let componentFieldListStack = [];
let componentObjectStack = [];
let componentStack = [];
let componentListStack = [];
let mainStack = [];

let inputNamesStack = [];
let outputNamesStack = [];
let childrenNamesStack = [];



exports.writeComponent = function () {
    console.error (`filename      = ${fileName}`);
    console.error (`componentName = ${componentName}`);
    console.error (`id            = ${idName}`);
    console.error (`childrenNames = [${childrenNames}]`);
    console.error (`inputNames    = [${inputNames}]`);
    console.error (`outputNames   = [${outputNames}]`);
    console.error (`connections   = [${connectionList}]`);
    console.error (`sync code     = ${syncCode}`);
    console.error ();
}



exports.name_newscope = function () {
    nameStack.push ([]);
}
exports.name_delscope = function () {
    nameStack.pop ();
}
exports.name_setfrom_nameStack = function (s) {
    nameStack.pop ();
    nameStack.push (s);
    return "";
}

exports.pair_newscope = function () {
    pairStack.push ({});
}
exports.pair_delscope = function () {
    pairStack.pop ();
}
exports.pair_setfield_port_from_name = function () {
    let topPair = pairStack.pop ();
    topPair.port = nameStack.pop ();
    return "";
}
exports.pair_setfield_component_from_name = function () {
    let topPair = pairStack.pop ();
    topPair.component = nameStack.pop ();
    return "";
}

exports.sender_newscope = function () {
    senderStack.push ({});
}
exports.sender_delscope = function () {
    senderStack.pop ();
}
exports.sender_setfrom_pair = function () {
    senderStack.pop ();
    senderStack.push (pairStack.pop ());
    return "";
}

exports.receiver_newscope = function () {
    receiverStack.push ({});
}
exports.receiver_delscope = function () {
    receiverStack.pop ();
}
exports.receiver_setfrom_pair = function () {
    receiverStack.pop ();
    receiverStack.push (pairStack.pop ());
    return "";
}

exports.senderOrReceiver_newscope = function () {
    senderOrReceiverStack.push ({});
}
exports.senderOrReceiver_delscope = function () {
    senderOrReceiverStack.pop ();
}
exports.senderOrReceiver_setor = function (choice) {
    if (choice === ">>Sender") {
	senderOrReceiverStack.pop ();
	senderOrReceiverStack.push (senderStack.pop ());
    return "";
    } else if (choice === ">>Receiver") {
	senderOrReceiverStack.pop ();
	senderOrReceiverStack.push (receiverStack.pop ());
    return "";
    } else {
	throw "internal error 1";
    }
}

exports.namesList_newscope = function () {
    namesListStack.push ([]);
}
exports.namesList_delscope = function () {
    namesListStack.pop ();
}
exports.namesList_appendfrom_name = function () {
    let top = namesListStack.pop ();
    while (0 < nameStack.length) {
	top.push (nameStack.pop ());
    }
    namesListStack.push (top);
    return "";
}

exports.name_newscope = function () {
    nameStack.push ('');
}
exports.name_delscope = function () {
    nameStack.pop ();
}

exports.connection_newscope = function () {
    connectionStack.push ({});
}
exports.connection_delscope = function () {
    connectionStack.pop ();
}
exports.connection_setfrom_senderOrReceiver = function () {
    connectionStack.pop ();
    connectionStack.push (senderOrReceiver.pop ());
    return "";
}
exports.connectionList_newscope = function () {
    connectionListStack.push ({});
}
exports.connectionList_delscope = function () {
    connectionListStack.pop ();
}
exports.connectionList_setfrom_connection = function () {
    let top = connectionListStack.pop ();
    while (connectionStack.length > 0) {
	top.push (connectionStack.pop ());
    }
    connectionListStack.push (top);
    return "";
}

exports.inputsField_newscope = function () {
    inputsFieldStack.push ({});
}
exports.inputsField_delscope = function () {
    inputsFieldStack.pop ();
}
exports.inputsField_setfrom_names = function () {
    let top = inputsFieldStack.pop ();
    while (nameStack.length > 0) {
	top.push (nameStack.pop ());
    }
    inputsFieldStack.push (top);
    return "";
}

exports.outputsField_newscope = function () {
    outputsFieldStack.push ({});
}
exports.outputsField_delscope = function () {
    outputsFieldStack.pop ();
}
exports.outputsField_setfrom_names = function () {
    let top = outputsFieldStack.pop ();
    while (nameStack.length > 0) {
	top.push (nameStack.pop ());
    }
    outputsFieldStack.push (top);
    return "";
}

exports.string_newscope = function () {
    stringStack.push ("");
}
exports.string_delscope = function () {
    stringStack.pop ();
}
exports.string_set = function (s) {
    stringStack.pop ();
    stringStack.push (s);
    return "";
}

exports.syncCodeField_newscope = function () {
    syncCodeFieldStack.push ({});
}
exports.syncCodeField_delscope = function () {
    syncCodeFieldStack.pop ();
}
exports.syncCodeField_setfrom_string = function () {
    syncCodeFieldStack.pop ();
    syncCodeFieldStack.pushd (stringStack.pop ());
    return "";
}
    
exports.nameField_newscope = function () {
    nameFieldStack.push ("");
}
exports.nameField_delscope  = function () {
    nameFieldStack.pop ();
}
exports.nameField_setfrom_name  = function () {
    nameFieldStack.pop ();
    nameFieldStack.push (nameStack.pop ());
    return "";
}

exports.idField_newscope = function () {
    idFieldStack.push ("");
}
exports.idField_delscope  = function() {
    idFieldStack.pop ();
}
exports.idField_setfrom_id  = function() {
    idFieldStack.pop ();
    idFieldStack.push (nameStack.pop ());
    return "";
}

exports.connectionsField_newscope = function () {
    connectionsFieldStack.push ({});
}
exports.connectionsField_delscope = function () {
    connectionsFieldStack.pop ();
}
exports.connectionsField_setfrom_connectionList = function () {
    connectionsFieldStack.pop ();
    connectionsFieldStack.push (connectionListStack.pop ());
    return "";
}


exports.childrenField_newscope = function () {
    console.error ("children field newscope");
    childrenFieldStack.push ([]);
}
exports.childrenField_delscope = function () {
    console.error ("children field delscope");
    childrenFieldStack.pop ();
}
exports.childrenField_setfrom_namesList = function () {
    console.error ("children field setfrom");
    childrenFieldStack.pop ();
    childrenFieldStack.push (namesListStack.pop ());
    return "";
}

exports.componentField_newscope = function () {
    componentFieldStack.push ({});
}
exports.componentField_delscope = function () {
    componentFieldStack.pop ();
}
exports.componentField_setor = function (choice) {
    console.error(choice);
    if (choice === ">>Children") {
	componentFieldStack.pop ();
	componentFieldStack.push (childrenFieldStack.pop ());
    return "";
    } else if (choice == ">>Connections") {
	componentFieldStack.pop ();
	componentFieldStack.push (connectionsFieldStack.pop ());
    return "";
    } else if (choice == ">>ID") {
	componentFieldStack.pop ();
	componentFieldStack.push (idFieldStack.pop ());
    return "";
    } else if (choice == ">>Name") {
	componentFieldStack.pop ();
	componentFieldStack.push (nameFieldStack.pop ());
    return "";
    } else if (choice == ">>SyncCode") {
	componentFieldStack.pop ();
	componentFieldStack.push (syncCodeFieldStack.pop ());
    return "";
    } else if (choice == ">>Inputs") {
	componentFieldStack.pop ();
	componentFieldStack.push (inputsFieldStack.pop ());
    return "";
    } else if (choice == ">>Outputs") {
	componentFieldStack.pop ();
	componentFieldStack.push (outputsFieldStack.pop ());
    return "";
    } else {
	throw "internal error 2";
    }
}

exports.componentFieldList_newscope = function () {
    componentFieldListStack.push ({});
}
exports.componentFieldList_delscope = function () {
    componentFieldListStack.pop ();
}
exports.componentFieldList_setfrom_componentFieldList = function () {
    var top = componentFieldList.pop ();
    while (componentFieldStack.length > 0) {
	top.push (componentFieldStack.pop ());
    }
    componentFieldList.push (top);
    return "";
}

exports.componentObject_newscope = function () {
    componentObjectStack.push ({});
}
exports.componentObject_delscope = function () {
    componentObjectStack.pop ();
}
exports.componentObject_setfrom_componentFieldList = function () {
    componentObjectStack.pop ();
    componentObjectStack.push (componentFieldListStack.pop ());
    return "";
}

exports.component_newscope = function () {
    componentStack.push ({});
}
exports.component_delscope = function () {
    componentStack.pop ();
}
exports.component_setfrom_componentObject = function () {
    componentStack.pop ();
    componentStack.push (componentObjectStack.pop ());
    return "";
}

exports.componentList_newscope = function () {
    componentListStack.push ({});
}
exports.componentList_delscope = function () {
    componentListStack.pop ();
}
exports.componentList_setfrom_component = function () {
    var top = componentListStack.pop ();
    while (componentStack.length > 0) {
	top.push (componentStack.pop ());
    }
    componentListStack.push (top);
    return "";
}

exports.mainStack_newscope = function () {
    mainStack.push ({});
}
exports.mainStack_delscope = function () {
    mainStack.pop ();
}
exports.mainStack_setfrom_componentList = function () {
    mainStack.pop ();
    mainStack.push (componentList.pop ());
    return "";
}

exports.inputNames_newscope = function () {
    inputNamesStack.push ({});
}
exports.inputNames_delscope = function () {
    inputNamesStack.pop ();
}
exports.inputNames_setfrom_namesList = function () {
    inputNamesStack.pop ();
    inputNamesStack.push (namesListStack.pop ());
    return "";
}

exports.outputNames_newscope = function () {
    outputNamesStack.push ({});
}
exports.outputNames_delscope = function () {
    outputNamesStack.pop ();
}
exports.outputNames_setfrom_namesList = function () {
    outputNamesStack.pop ();
    outputNamesStack.push (namesListStack.pop ());
    return "";
}

exports.childrenNames_newscope = function () {
    childrenNamesStack.push ({});
}
exports.childrenNames_delscope = function () {
    childrenNamesStack.pop ();
}
exports.childrenNames_setfrom_namesList = function () {
    childrenNamesStack.pop ();
    childrenNamesStack.push (namesListStack.pop ());
    return "";
}

