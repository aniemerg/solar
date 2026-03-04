//@ compile-flags: -Ztypeck
contract test {
    mapping(ufixed8x1 => string) fixedString; //~ ERROR: unresolved symbol `ufixed8x1`
    function f() public {
        fixedString[0.5] = "Half";
    }
}
