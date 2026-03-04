//@ compile-flags: -Ztypeck
contract test {
    function f() public {
        uint[] memory a;
        a[.5]; //~ ERROR: rational literals are not supported
    }
}
