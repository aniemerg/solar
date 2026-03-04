//@ compile-flags: -Ztypeck
contract C {
  function f() public view {
    address payable a = address(this); //~ ERROR: mismatched types
    a;
  }
  fallback() external {
  }
}
