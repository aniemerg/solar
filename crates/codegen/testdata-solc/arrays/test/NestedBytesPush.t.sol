// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/NestedBytesPush.sol";

contract NestedBytesPushTest is Test {
    function test_NestedBytesPush() public {
        NestedBytesPush c = new NestedBytesPush();
        c.f();
    }
}
