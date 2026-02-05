// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/ArrayMemoryIndexAccess.sol";

contract ArrayMemoryIndexAccessTest is Test {
    ArrayMemoryIndexAccess c;

    function setUp() public {
        c = new ArrayMemoryIndexAccess();
    }

    function test_ArrayMemoryIndexAccess_Index() public view {
        assert(c.index(0) == true);
        assert(c.index(10) == true);
        assert(c.index(20) == true);
        assert(c.index(0xff) == true);
    }

    function test_ArrayMemoryIndexAccess_AccessIndex() public view {
        assert(c.accessIndex(10, 1) == 2);
        assert(c.accessIndex(10, 0) == 1);
    }

    function test_ArrayMemoryIndexAccess_AccessIndex_OutOfBounds() public {
        vm.expectRevert();
        c.accessIndex(10, 11);
    }
}
