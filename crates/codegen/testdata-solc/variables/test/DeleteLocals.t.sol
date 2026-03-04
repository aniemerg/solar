// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/DeleteLocals.sol";

contract DeleteLocalsTest {
    function test_DeleteLocals() public {
        DeleteLocals c = new DeleteLocals();
        (uint res1, uint res2) = c.delLocal();
        assert(res1 == 6);
        assert(res2 == 7);
    }
}
