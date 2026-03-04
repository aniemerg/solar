//@ compile-flags: -Ztypeck
contract test {
    function f() public {
        fixed a = 3.25; //~ ERROR: rational literals are not supported
        bytes32 c = a; c; //~ ERROR: mismatched types
    }
}
