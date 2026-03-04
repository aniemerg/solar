//@ compile-flags: -Ztypeck
contract C {
    function k() pure public returns (bytes memory) {
        return abi.encodePacked(1); //~ ERROR: wrong argument count for function call: 1 arguments given but expected 0
    }
}
