//@ compile-flags: -Ztypeck
contract C {
  function f() public pure {
    fixed f1 = 3.14_15; //~ ERROR: rational literals are not supported
    fixed f2 = 3_1.4_15; //~ ERROR: rational literals are not supported

    f1; f2;
  }
}
// ====
// compileViaYul: true
