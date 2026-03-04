//@ compile-flags: -Ztypeck
contract Test {
    event MyCustomEvent(uint);
    function f() public {
        uint[] memory a;
        a[MyCustomEvent]; //~ ERROR: mismatched types
    }
}
