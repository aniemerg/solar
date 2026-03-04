//@ compile-flags: -Ztypeck
error E(uint[] calldata); //~ ERROR: data locations are not allowed here
