//@ compile-flags: -Ztypeck
contract C {
    function f() public pure returns(bytes1) {
        return bytes1(uint256(0)); //~ ERROR: invalid explicit type conversion
    }
}
