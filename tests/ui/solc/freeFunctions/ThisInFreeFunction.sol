contract C {}
function f() {
    this; //~ ERROR: unresolved symbol `this`
}
