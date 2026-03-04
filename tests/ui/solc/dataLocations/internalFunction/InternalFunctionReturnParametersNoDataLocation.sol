//@ compile-flags: -Ztypeck
contract C {
    function g() internal pure returns(uint[]) {} //~ ERROR: expected data location
}
