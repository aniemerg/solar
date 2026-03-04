//@ compile-flags: -Ztypeck
contract C {
    function f(int32 x) external pure returns (int32)
    {
        this.x + 1; //~ ERROR: member `x` not found on type `contract C`
        return x;
    }
}
