//@ compile-flags: -Ztypeck
contract C {
  function f() public {
    bytes memory a;
    a[]; //~ ERROR: index expression cannot be omitted
  }
}
