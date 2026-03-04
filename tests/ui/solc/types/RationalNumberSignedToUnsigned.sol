//@ compile-flags: -Ztypeck
contract c {
    function f() public pure {
        uint a = -1; //~ ERROR: mismatched types
        uint b = uint(-1); //~ ERROR: invalid explicit type conversion
    }
}
