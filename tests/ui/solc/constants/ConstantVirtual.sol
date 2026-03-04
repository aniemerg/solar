//@ compile-flags: -Ztypeck
uint constant virtual x; //~ ERROR: `virtual` is not allowed here
//~^ ERROR: constant variable must be initialized
