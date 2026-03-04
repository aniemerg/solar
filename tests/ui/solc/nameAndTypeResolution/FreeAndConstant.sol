//@ compile-flags: -Ztypeck
uint constant c = 7;
function c() returns (uint) {} //~ ERROR: identifier `c` already declared
