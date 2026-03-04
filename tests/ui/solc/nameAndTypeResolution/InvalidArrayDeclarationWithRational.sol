//@ compile-flags: -Ztypeck
contract test {
    function f() public {
        uint[3.5] a; a; //~ ERROR: failed to evaluate constant: unsupported literal
    }
}
