//@ compile-flags: -Ztypeck
contract C {
    function f() public pure returns(bytes32) {
        return bytes32(uint32(0)); //~ ERROR: invalid explicit type conversion
    }
}
