//@ compile-flags: -Ztypeck
contract test {
    function f(uint x, uint y) public returns (uint a) {}
    function g() public {
        function (uint, uint) internal returns (uint) f1 = f; //~ ERROR: mismatched types
    }
}
