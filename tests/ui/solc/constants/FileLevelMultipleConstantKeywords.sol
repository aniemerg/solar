//@ compile-flags: -Ztypeck
uint constant constant x; //~ ERROR: mutability already specified
//~^ ERROR: constant variable must be initialized
