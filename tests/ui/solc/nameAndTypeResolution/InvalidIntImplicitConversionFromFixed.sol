//@ compile-flags: -Ztypeck
contract test {
    function f() public {
        fixed a = 4.5; //~ ERROR: rational literals are not supported
        int b = a; //~ ERROR: mismatched types
        a; b;
    }
}
