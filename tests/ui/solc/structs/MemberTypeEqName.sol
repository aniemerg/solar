//@ compile-flags: -Ztypeck
contract C {
  struct S {t t;} //~ ERROR: unresolved symbol `t`
  function f(function(S memory) external) public {}
}
