function f() pure returns (uint)
{
    return 1;
}

pragma experimental solidity; //~ ERROR: experimental solidity features are not supported

struct A
{
    uint256 x;
}
