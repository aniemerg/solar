// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

import "forge-std/Test.sol";
import "../src/NestedArrayElementStorageToStorage.sol";

contract NestedArrayElementStorageToStorageTest is Test {
    function test_NestedArrayElementStorageToStorage() public {
        NestedArrayElementStorageToStorage c = new NestedArrayElementStorageToStorage();

        // run1() -> (no revert)
        c.run1();

        // run2() -> FAILURE (require fails because dst2[0][0]=6 != src2[1][0][0]=10)
        vm.expectRevert();
        c.run2();

        // run3() -> (no revert)
        c.run3();

        // run4() -> FAILURE (dst4 only has 1 element after copying src4[1], so dst4.length==2 fails)
        vm.expectRevert();
        c.run4();
    }
}
