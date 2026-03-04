//@ compile-flags: -Ztypeck
library L {
    event E(uint);
}

function f() {
    abi.encodeCall(L.E, (1)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
//~^ ERROR: member `E` not found on type `type(library L)`
}
