//@ compile-flags: -Ztypeck
contract A {
    uint dummy;
    function f(uint[] calldata) external virtual pure {}
    function g(uint[] calldata) external virtual view { dummy; }
    function h(uint[] calldata) external virtual { dummy = 42; }
    function i(uint[] calldata) external virtual payable {}
}
contract B is A {
    function f(uint[] calldata) external override pure {} //~ ERROR: function with same name and parameter types declared twice
    function g(uint[] calldata) external override view { dummy; } //~ ERROR: function with same name and parameter types declared twice
    function h(uint[] calldata) external override { dummy = 42; } //~ ERROR: function with same name and parameter types declared twice
    function i(uint[] calldata) external override payable {} //~ ERROR: function with same name and parameter types declared twice
    function f(uint[] memory) public override pure {}
    function g(uint[] memory) public override view { dummy; }
    function h(uint[] memory) public override { dummy = 42; }
    function i(uint[] memory) public override payable {}
}
