//@ compile-flags: -Ztypeck
error E();

contract C {
    function() internal pure x = E; //~ ERROR: mismatched types
}
