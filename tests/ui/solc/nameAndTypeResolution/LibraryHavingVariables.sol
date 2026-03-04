//@ compile-flags: -Ztypeck
library Lib { uint x; } //~ ERROR: library cannot have non-constant state variable
