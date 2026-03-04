// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/DeleteRemovesBytesData.sol";

contract DeleteRemovesBytesDataTest is Test {
    function test_DeleteRemovesBytesData() public {
        DeleteRemovesBytesData c = new DeleteRemovesBytesData();
        // Trigger fallback with data byte 0x07 to set storage
        (bool ok,) = address(c).call(hex"07");
        assertTrue(ok);
        // Now delete the data
        assertEq(c.del(), true);
    }
}
