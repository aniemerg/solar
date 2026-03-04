//@ compile-flags: -Ztypeck
contract C {
    function h() public pure returns(uint[] transient) {} //~ ERROR: expected data location
}
