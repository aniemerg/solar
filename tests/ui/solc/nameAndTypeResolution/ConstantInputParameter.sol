//@ compile-flags: -Ztypeck
contract test {
    function f(uint[] memory constant a) public { } //~ ERROR: mutability is not allowed here
}
