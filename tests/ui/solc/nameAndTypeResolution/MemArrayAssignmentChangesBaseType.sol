//@ compile-flags: -Ztypeck
contract C {
    function f(uint8[] memory x) private {
        // Such an assignment is possible in storage, but not in memory
        // (because it would incur an otherwise unnecessary copy).
        // This requirement might be lifted, though.
        uint[] memory y = x; //~ ERROR: mismatched types
    }
}
