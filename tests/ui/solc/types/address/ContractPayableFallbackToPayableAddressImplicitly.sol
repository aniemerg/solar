//@ compile-flags: -Ztypeck
contract C { //~ WARN: contract has a payable fallback function, but no receive ether function
  function f() public view {
    address payable a = this; //~ ERROR: mismatched types
    a;
  }
  fallback() external payable {
  }
}
