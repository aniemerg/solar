//@ compile-flags: -Ztypeck
contract test {
    function f() public returns (uint) { return 1; }
    function f(uint a) public returns (uint) { return a; }
    function g() public returns (uint) { return f(3, 5); } //~ ERROR: no matching declarations found
}
