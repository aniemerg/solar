//@ compile-flags: -Ztypeck
contract C {
    function f(int32 x) external pure returns (int32)
    {
        x = 1 + 1; //~ ERROR: mismatched types
        (x /= 1) + 1;
        (x = ++x) + 1;
        (0) + 1;
        return x;
    }
}
