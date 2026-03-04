//@ compile-flags: -Ztypeck
contract C {
    function i() external pure returns(uint[]) {} //~ ERROR: expected data location
}
