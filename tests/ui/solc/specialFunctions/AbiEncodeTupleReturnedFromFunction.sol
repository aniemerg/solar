//@ compile-flags: -Ztypeck
contract C {
    function g0() internal pure {}
    function g1() internal pure returns (uint) { return (1); }
    function g2() internal pure returns (uint, uint) { return (2, 3); }

    function h() public pure {
        abi.encode(g0()); //~ ERROR: wrong argument count for function call: 1 arguments given but expected 0
        abi.encode(g2()); //~ ERROR: wrong argument count for function call: 1 arguments given but expected 0
        abi.encode((g1(), g1())); //~ ERROR: wrong argument count for function call: 1 arguments given but expected 0
    }
}
