//@ compile-flags: -Ztypeck
contract C {
    function f(bytes32 x) public pure returns (address payable) {
        return address(x); //~ ERROR: invalid explicit type conversion
    }
}
