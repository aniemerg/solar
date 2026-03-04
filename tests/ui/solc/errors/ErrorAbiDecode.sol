//@ compile-flags: -Ztypeck
error MyCustomError(uint, bool);
contract Test {
    function f() public {
        abi.decode(MyCustomError, (bool)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
    }
}
