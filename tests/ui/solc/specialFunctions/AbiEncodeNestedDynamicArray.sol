//@ compile-flags: -Ztypeck
pragma abicoder v1;
contract C {
    function test() public pure {
        abi.encode([new uint[](5), new uint[](7)]); //~ ERROR: wrong argument count for function call: 1 arguments given but expected 0
//~^ ERROR: wrong argument count for function call: 1 arguments given but expected 0
//~^^ ERROR: wrong argument count for function call: 1 arguments given but expected 0
    }
}
