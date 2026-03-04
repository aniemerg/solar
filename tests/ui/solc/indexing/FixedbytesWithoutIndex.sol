//@ compile-flags: -Ztypeck
contract C {
  function f() public {
    bytes32 b;
    b[]; //~ ERROR: index expression cannot be omitted
  }
}
