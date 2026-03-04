//@ compile-flags: -Ztypeck
contract test {
    function f() public {
        fixed[3] memory a = [fixed(3.5), fixed(-4.25), fixed(967.125)]; //~ ERROR: rational literals are not supported
//~^ ERROR: rational literals are not supported
//~^^ ERROR: rational literals are not supported
//~^^^ ERROR: mismatched types
    }
}
