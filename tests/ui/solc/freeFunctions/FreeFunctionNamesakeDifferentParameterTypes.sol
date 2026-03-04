function g() pure returns (uint) { return 1; } //~ ERROR: function with same name and parameter types declared twice
function g() pure returns (string memory) { return "1"; }
contract C {
  function foo() public pure returns (uint) {
    string memory s = g();
    return 100/g();
  }
}
