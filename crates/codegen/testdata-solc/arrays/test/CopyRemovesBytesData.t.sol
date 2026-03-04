// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CopyRemovesBytesData.sol";

contract CopyRemovesBytesDataTest {
    function test_CopyRemovesBytesData() public {
        CopyRemovesBytesData c = new CopyRemovesBytesData();
        // set(): 1, 2, 3, 4, 5 -> true
        assert(c.set() == true);
        // reset() -> true
        assert(c.reset() == true);
    }
}
