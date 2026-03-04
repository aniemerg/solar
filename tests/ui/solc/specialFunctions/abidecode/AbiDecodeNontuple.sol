//@ compile-flags: -Ztypeck
contract C {
  function f() public pure {
    abi.decode("abc", uint); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
    abi.decode("abc", this); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
    abi.decode("abc", f()); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
  }
}
