//@ compile-flags: -Ztypeck
contract test {
    function f() public {
        fixed a = 4.5; //~ ERROR: rational literals are not supported
        ufixed d = 2.5; //~ ERROR: rational literals are not supported
        a; d;
    }
}
