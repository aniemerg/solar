//@ compile-flags: -Ztypeck
contract C {
    function f() private pure returns(uint[]) {} //~ ERROR: expected data location
}
