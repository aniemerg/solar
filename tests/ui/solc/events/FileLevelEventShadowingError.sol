//@ compile-flags: -Ztypeck
event E();
error E(); //~ ERROR: identifier `E` already declared
