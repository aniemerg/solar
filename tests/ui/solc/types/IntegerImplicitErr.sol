//@ compile-flags: -Ztypeck
contract C
{
    function f() public pure {
        uint16 a = 1;
        int32 b = a; //~ ERROR: mismatched types

        uint256 c = 10;
        int8 d = c; //~ ERROR: mismatched types
    }
}
