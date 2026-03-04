//@ compile-flags: -Ztypeck
contract C {
    function f() private pure returns (uint[] transient) {} //~ ERROR: expected data location
}
