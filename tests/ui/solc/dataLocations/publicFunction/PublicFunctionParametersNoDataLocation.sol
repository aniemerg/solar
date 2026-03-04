//@ compile-flags: -Ztypeck
contract C {
    function h(uint[]) public pure {} //~ ERROR: expected data location
}
