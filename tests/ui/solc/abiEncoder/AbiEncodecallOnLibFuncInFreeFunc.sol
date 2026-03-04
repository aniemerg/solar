//@ compile-flags: -Ztypeck
library L {
    function g() external {}
}

function f() {
    abi.encodeCall(L.g, (1)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
//~^ ERROR: member `g` not found on type `type(library L)`
}
