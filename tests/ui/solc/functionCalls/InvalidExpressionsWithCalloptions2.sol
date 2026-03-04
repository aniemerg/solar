//@ compile-flags: -Ztypeck
contract D {}
contract C {
    function foo(int a) pure external {
      this.foo{random:5+5}; //~ ERROR: call options must be part of a call expression
    }
}
