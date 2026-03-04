//@ compile-flags: -Ztypeck
contract test {
    function f() public {
        fixed c = 3; //~ ERROR: mismatched types
        ufixed d = 4; //~ ERROR: mismatched types
        c; d;
    }
}
