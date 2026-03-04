//@ compile-flags: -Ztypeck
event E(); //~ ERROR: event with same name and parameter types declared twice
event E();
