//@ compile-flags: -Ztypeck
contract C {
  function f() public {}
  struct S {f x;} //~ ERROR: name has to refer to a valid user-defined type
  function g(function(S memory) external) public {}
}
