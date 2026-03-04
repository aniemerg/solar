//@ compile-flags: -Ztypeck
contract C {
    function f() public pure {
        (uint a, uint b) = f(); //~ ERROR: mismatched number of components
        (uint c) = f(); //~ ERROR: mismatched number of components
        uint d = f(); //~ ERROR: mismatched number of components
    }
}
