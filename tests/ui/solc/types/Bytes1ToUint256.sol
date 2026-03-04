//@ compile-flags: -Ztypeck
contract C {
    function f() public pure returns(uint256) {
        return uint256(bytes1('')); //~ ERROR: invalid explicit type conversion
    }
}
