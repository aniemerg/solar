// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/ReusingMemory.sol";

contract ReusingMemoryTest is Test {
    function test_ReusingMemory() public {
        ReusingMemory c = new ReusingMemory();
        // f(0x34) -> keccak256(abi.encodePacked(0x34)) stored as Helper.flag
        uint256 x = 0x34;
        uint256 expected = uint256(keccak256(abi.encodePacked(x)));
        assertEq(c.f(x), expected);
    }
}
