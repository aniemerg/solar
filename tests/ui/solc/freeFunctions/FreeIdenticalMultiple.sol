function f() pure returns (uint) { return 1337; } //~ ERROR: function with same name and parameter types declared twice
function f() pure returns (uint) { return 42; }
function f() pure returns (uint) { return 1; }
