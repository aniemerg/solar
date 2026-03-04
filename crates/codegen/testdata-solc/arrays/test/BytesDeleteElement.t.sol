// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/BytesDeleteElement.sol";

contract BytesDeleteElementTest is Test {
    function test_BytesDeleteElement() public {
        BytesDeleteElement c = new BytesDeleteElement();
        assertEq(c.test1(), true);
    }
}
