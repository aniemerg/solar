//@ compile-flags: -Ztypeck
contract C {
    bytes32 constant x = keccak256("abc"); //~ ERROR: mismatched types
    bytes32 constant y = x;
    function f() public pure returns (uint t) {
        assembly {
            t := y
        }
    }
}
