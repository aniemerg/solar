//@ compile-flags: -Ztypeck
contract C {
    function f() public pure returns(uint32) {
        return uint32(bytes32('')); //~ ERROR: invalid explicit type conversion
    }
}
