//@ compile-flags: -Ztypeck
contract test {
    function f() public {
        uint[ufixed(3.5)] a; a; //~ ERROR: failed to evaluate constant: unsupported expression
    }
}
