//@ compile-flags: -Ztypeck
contract test {
    function f(bytes transient) public; //~ ERROR: expected data location
}
