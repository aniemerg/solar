// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataBytesArrayBounds.sol";

contract CalldataBytesArrayBoundsTest is Test {
    function test_CalldataBytesArrayBounds() public {
        CalldataBytesArrayBounds c = new CalldataBytesArrayBounds();
        bytes[] memory a = new bytes[](1);
        a[0] = "ab";

        assertEq(c.f(a, 0), 0x61); // 'a'
        assertEq(c.f(a, 1), 0x62); // 'b'

        vm.expectRevert();
        c.f(a, 2);
    }
}
