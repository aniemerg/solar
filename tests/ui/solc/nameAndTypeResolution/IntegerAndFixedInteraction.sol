//@ compile-flags: -Ztypeck
contract test {
    function f() public {
        ufixed a = uint64(1) + ufixed(2); //~ ERROR: invalid explicit type conversion
    }
}
