//@ compile-flags: -Ztypeck
contract test {
    function f() public {
        fixed g = 2 ** -2.2; //~ ERROR: rational literals are not supported
    }
}
