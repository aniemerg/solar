//@ compile-flags: -Ztypeck
function Err() pure {}
error Err(); //~ ERROR: identifier `Err` already declared
