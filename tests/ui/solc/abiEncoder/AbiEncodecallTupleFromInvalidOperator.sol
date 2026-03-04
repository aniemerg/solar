//@ compile-flags: -Ztypeck
contract C {
    event Ev();
    error Er();

    function g0() internal pure {}
    function g2() internal pure returns (uint, uint) { return (2, 3); }

    function f0() public {}
    function f2(uint, uint) public {}

    function h() public view {
        abi.encodeCall(this.f2, (1, 1) + (2, 2)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
//~^ ERROR: cannot apply builtin operator `+` to `tuple(int_literal[1],int_literal[1])` and `tuple(int_literal[2],int_literal[2])`
        abi.encodeCall(this.f0, Ev() / Er()); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
//~^ ERROR: event invocations have to be prefixed by "emit"
//~^^ ERROR: errors can only be used with revert statements
//~^^^ ERROR: cannot apply builtin operator `/` to `tuple()` and `tuple()`
        abi.encodeCall(this.f0, !()); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
//~^ ERROR: cannot apply unary operator `!` to `tuple()`
    }
}
