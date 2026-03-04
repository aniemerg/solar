//@ compile-flags: -Ztypeck
error MyCustomError(uint, bool);
contract Test {
    function f() public {
        uint[] memory a;
        a[MyCustomError]; //~ ERROR: mismatched types
    }
}
