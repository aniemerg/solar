//@ compile-flags: -Ztypeck
function fun() {}

contract C is fun {} //~ ERROR: expected contract, found function
