//@ compile-flags: -Ztypeck
contract test {
    uint256 variable;
    function f(uint256 arg) public {
        f(notfound); //~ ERROR: unresolved symbol `notfound`
    }
}
