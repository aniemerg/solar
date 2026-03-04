//@ compile-flags: -Ztypeck
contract C {
    function f(uint[]) private pure {} //~ ERROR: expected data location
}
