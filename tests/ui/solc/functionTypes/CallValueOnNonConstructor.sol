//@ compile-flags: -Ztypeck
contract C {
  // Tests that we don't get a wrong error about constructors
  function f() public view returns (C) { return this; }
  function g() public { this.f.value(); } //~ ERROR: member `value` not found on type `function () view returns (contract C)`
}
