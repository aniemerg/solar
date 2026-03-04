//@ compile-flags: -Ztypeck
contract D {}
contract C {
  function foo(int a) external {
    this.foo{slt:5, value:3, salt: 8}; //~ ERROR: call options must be part of a call expression
  }
}
