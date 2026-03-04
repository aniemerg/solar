// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/DeleteLocal.sol";

contract DeleteLocalTest {
    function test_DeleteLocal() public {
        DeleteLocal c = new DeleteLocal();
        assert(c.delLocal() == 0);
    }
}
