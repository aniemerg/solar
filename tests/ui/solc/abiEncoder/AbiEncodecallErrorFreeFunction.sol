//@ compile-flags: -Ztypeck
error E(uint);

function f() {
    abi.encodeCall(E, (1)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
}
