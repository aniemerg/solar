//@ compile-flags: -Ztypeck
error E(uint);
contract C {
    function f() public pure returns (bytes memory) {
        return abi.encode(E); //~ ERROR: wrong argument count for function call: 1 arguments given but expected 0
    }
}
