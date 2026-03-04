//@ compile-flags: -Ztypeck
contract C {
    function g0() internal pure {}
    function g2() internal pure returns (uint, uint) { return (2, 3); }

    function f0() public {}
    function f2(uint, uint) public {}

    function h() public view {
        uint a;
        uint b;

        abi.encodeCall(this.f0, () = g0()); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
//~^ ERROR: empty tuple on the left hand side
        abi.encodeCall(this.f0, () = ()); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
//~^ ERROR: empty tuple on the left hand side
        abi.encodeCall(this.f2, (a, b) = g2()); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        abi.encodeCall(this.f2, (a, b) = (2, 3)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
    }
}
