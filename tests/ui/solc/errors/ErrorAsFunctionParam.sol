//@ compile-flags: -Ztypeck
error E(uint);
function f(E x) pure returns (uint) {} //~ ERROR: name has to refer to a valid user-defined type
