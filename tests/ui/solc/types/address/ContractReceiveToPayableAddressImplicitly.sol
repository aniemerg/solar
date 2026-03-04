//@ compile-flags: -Ztypeck
contract C {
  function f() public view {
    address payable a = this; //~ ERROR: mismatched types
    a;
  }
  receive() external payable {
  }
}
