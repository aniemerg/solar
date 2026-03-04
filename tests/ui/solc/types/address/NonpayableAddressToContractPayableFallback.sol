//@ compile-flags: -Ztypeck
contract C { //~ WARN: contract has a payable fallback function, but no receive ether function
  function f() public pure returns (C c) {
    address a = address(2); //~ ERROR: invalid explicit type conversion
    c = C(a); //~ ERROR: invalid explicit type conversion
  }
  fallback() external payable {
  }
}
