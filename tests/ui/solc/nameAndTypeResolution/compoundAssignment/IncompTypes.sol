//@ compile-flags: -Ztypeck
contract C {
    function f() public returns (uint a, uint b) {
        a += (1, 1); //~ ERROR: cannot apply builtin operator `+` to `uint256` and `tuple(int_literal[1],int_literal[1])`
    }
}
