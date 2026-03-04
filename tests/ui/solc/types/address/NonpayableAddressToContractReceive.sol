//@ compile-flags: -Ztypeck
contract C {
  function f() public pure returns (C c) {
    address a = address(2); //~ ERROR: invalid explicit type conversion
    c = C(a); //~ ERROR: invalid explicit type conversion
  }
  receive() external payable {
  }
}
