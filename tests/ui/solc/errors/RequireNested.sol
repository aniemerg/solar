//@ compile-flags: -Ztypeck
error CustomError(uint256);

contract C
{
    function f() public pure returns (uint256)
    {
        require(false, require(CustomError(1))); //~ ERROR: no matching declarations found
        return 2;
    }
}
