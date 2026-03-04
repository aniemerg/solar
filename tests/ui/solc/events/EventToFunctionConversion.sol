//@ compile-flags: -Ztypeck

contract C {
    event E(uint);
    function() internal pure x = E; //~ ERROR: mismatched types
}
