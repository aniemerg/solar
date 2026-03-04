//@ compile-flags: -Ztypeck
contract Test {}
library Lib is Test {} //~ ERROR: library is not allowed to inherit
