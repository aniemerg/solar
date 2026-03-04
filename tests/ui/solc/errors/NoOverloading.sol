//@ compile-flags: -Ztypeck
error Err(uint);
error Err(bytes32); //~ ERROR: identifier `Err` already declared
