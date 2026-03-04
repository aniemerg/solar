//@ compile-flags: -Ztypeck
contract C {
    function f() public returns (uint a, uint b) {
        (a, b) += (1, 1); //~ ERROR: compound assignment is not allowed for tuples
    }
}
