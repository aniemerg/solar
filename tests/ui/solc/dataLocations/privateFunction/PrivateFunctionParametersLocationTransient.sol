//@ compile-flags: -Ztypeck
contract C {
    function f(uint[] transient) private pure {} //~ ERROR: expected data location
}
