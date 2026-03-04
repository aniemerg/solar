//@ compile-flags: -Ztypeck
pragma abicoder               v2;

contract C {
    function f() public pure {
        abi.encodePacked([new uint[](5), new uint[](7)]); //~ ERROR: wrong argument count for function call: 1 arguments given but expected 0
//~^ ERROR: wrong argument count for function call: 1 arguments given but expected 0
//~^^ ERROR: wrong argument count for function call: 1 arguments given but expected 0
    }
}
