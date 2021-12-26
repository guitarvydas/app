exports.replnl = function (s) {
    // we want to put all lines onto one
    // but, it is not enough to simply trim() nls from the lines, we must replace nls with whitespace
    return s.trim ();
}
