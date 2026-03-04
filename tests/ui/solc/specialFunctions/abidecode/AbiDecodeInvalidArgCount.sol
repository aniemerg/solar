//@ compile-flags: -Ztypeck
contract C {
  function f() public pure {
    abi.decode();
    abi.decode(msg.data); //~ ERROR: wrong argument count for function call: 1 arguments given but expected 0
    abi.decode(msg.data, uint, uint); //~ ERROR: wrong argument count for function call: 3 arguments given but expected 0
  }
}
