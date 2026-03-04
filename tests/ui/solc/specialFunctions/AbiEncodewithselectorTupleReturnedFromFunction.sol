//@ compile-flags: -Ztypeck
contract C {
    function g0() internal pure {}
    function g1() internal pure returns (uint) { return (1); }
    function g2() internal pure returns (uint, uint) { return (2, 3); }

    function f0() public {}
    function f1(uint) public {}
    function f2(uint, uint) public {}

    function h() public pure {
        abi.encodeWithSelector(this.f0.selector, g0()); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        abi.encodeWithSelector(this.f0.selector, g2()); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        abi.encodeWithSelector(this.f0.selector, (g1(), g1())); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
    }
}
