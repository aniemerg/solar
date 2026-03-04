function f() pure returns (uint) { return 1337; } //~ ERROR: function with same name and parameter types declared twice
function f() view returns (uint) { return 42; }
contract C {
  function g() public pure virtual returns (uint) {
    return f();
  }
}
