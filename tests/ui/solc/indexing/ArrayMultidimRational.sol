//@ compile-flags: -Ztypeck
contract C {
  function f() public {
    bytes[32] memory a;
    a[8**90][8**90][8**90*0.1]; //~ ERROR: rational literals are not supported
  }
}
