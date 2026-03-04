//@ compile-flags: -Ztypeck
contract Test {
    function f() public pure {
        type(C).creationCode = new bytes(6); //~ ERROR: wrong argument count for function call: 1 arguments given but expected 0
        type(C).runtimeCode = new bytes(6); //~ ERROR: wrong argument count for function call: 1 arguments given but expected 0
    }
}
contract C {}
