//@ compile-flags: -Ztypeck
uint constant c = 7;
uint constant c = 8; //~ ERROR: identifier `c` already declared
