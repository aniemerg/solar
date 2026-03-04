//@ compile-flags: -Ztypeck
contract test {
    function f() public {
        ufixed c = 42 ** fixed(-1/4); //~ ERROR: invalid explicit type conversion
    }
}
