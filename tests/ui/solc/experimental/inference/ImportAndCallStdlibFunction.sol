pragma experimental solidity;

import { identity as id } from std.stub; //~ ERROR: expected string literal, found `std`

contract C
{
    fallback() external
    {
        id();
    }
}
