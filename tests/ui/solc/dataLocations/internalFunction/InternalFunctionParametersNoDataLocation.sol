//@ compile-flags: -Ztypeck
contract C {
    function g(uint[]) internal pure {} //~ ERROR: expected data location
}
