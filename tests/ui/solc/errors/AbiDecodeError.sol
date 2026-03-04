//@ compile-flags: -Ztypeck
error E(uint);
contract C {
    function f() public pure returns (bytes memory) {
        return abi.decode(msg.data, (E)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
    }
}
