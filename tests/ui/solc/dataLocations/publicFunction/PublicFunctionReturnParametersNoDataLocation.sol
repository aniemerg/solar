//@ compile-flags: -Ztypeck
contract C {
    function h() public pure returns(uint[]) {} //~ ERROR: expected data location
}
