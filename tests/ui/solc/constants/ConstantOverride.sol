//@ compile-flags: -Ztypeck
uint constant override x = 2; //~ ERROR: `override` is not allowed here
