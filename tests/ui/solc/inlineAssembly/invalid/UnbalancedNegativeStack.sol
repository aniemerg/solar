//@ compile-flags: -Ztypeck
contract test {
    function f() public {
        assembly {
            pop
        } //~ ERROR: expected one of `(`, `,`, or `:=`, found `}`
    }
}
