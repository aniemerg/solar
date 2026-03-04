//@ compile-flags: -Ztypeck
function g(uint) {}

function f() {
    abi.encodeCall(g, (1)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
}
