//@ compile-flags: -Ztypeck
contract test {
    function f(bytes transient) internal {} //~ ERROR: expected data location
}
