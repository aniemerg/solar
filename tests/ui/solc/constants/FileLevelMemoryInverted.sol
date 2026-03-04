//@ compile-flags: -Ztypeck
uint[] constant memory x = 2; //~ ERROR: data locations are not allowed here
