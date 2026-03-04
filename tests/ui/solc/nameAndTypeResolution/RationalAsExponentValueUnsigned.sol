//@ compile-flags: -Ztypeck
contract test {
    function f() public {
        ufixed b = 3 ** 2.5; //~ ERROR: rational literals are not supported
    }
}
