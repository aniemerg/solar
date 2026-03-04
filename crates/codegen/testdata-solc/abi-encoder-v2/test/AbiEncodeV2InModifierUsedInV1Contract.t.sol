// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/AbiEncodeV2InModifierUsedInV1Contract.sol";

contract AbiEncodeV2InModifierUsedInV1ContractTest is Test {
    CMod c;

    function setUp() public {
        c = new CMod();
    }

    function test_test() public {
        // test() -> 5, 10
        // x gets updated to 5 before the function body, y gets updated to 5 after
        // But y starts as 10 and is updated after, so return is (5, 10) before y updated,
        // but actually modifier updates y after return statement. Return captures (x=5, y=10_old).
        // Wait - y is updated AFTER the function body (_ is where the function runs)
        // So: x=5 (before _), function runs returning (x=5, y=10), then y=5 (after _)
        // But the return captures x and y at time of return, which is during _
        // At that point x=5, y=10 (not yet updated)
        (uint x, uint y) = c.test();
        assertEq(x, 5);
        assertEq(y, 10);
    }
}
