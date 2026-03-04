//@ compile-flags: -Ztypeck
contract C {
    function g0() internal pure {}
    function g2() internal pure returns (uint, uint) { return (2, 3); }

    function f0() public {}
    function f2(uint, uint) public {}

    function h() public view {
        abi.encodeCall(this.f0, true ? g0() : g0()); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        abi.encodeCall(this.f2, true ? g2() : g2()); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        abi.encodeCall(this.f2, true ? (1, 2) : (3, 4)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
    }
}
