//@ compile-flags: -Ztypeck
uint[] memory constant x = 2; //~ ERROR: data locations are not allowed here
