//@ compile-flags: -Ztypeck
contract Test {
    event E(uint);
    function f() public {
        abi.decode(E, (bool)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
    }
}
