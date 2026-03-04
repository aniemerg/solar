//@ compile-flags: -Ztypeck
contract A { function f() public {} }
contract B is A {
  function A() public pure returns (uint8) {}
  function g() public {
    A.f(); //~ ERROR: member `f` not found on type `function () pure returns (uint8)`
  }
}
