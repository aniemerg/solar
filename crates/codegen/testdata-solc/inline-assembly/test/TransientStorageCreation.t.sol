// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/TransientStorageCreation.sol";

contract TransientStorageCreationTest is Test {
    // constructor() ->
    // Constructor asserts x == 42 internally
    function test_constructor() public {
        new TransientStorageCreation(); // Should not revert
    }
}
