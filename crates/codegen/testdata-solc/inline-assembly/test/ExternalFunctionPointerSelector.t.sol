// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/ExternalFunctionPointerSelector.sol";

contract ExternalFunctionPointerSelectorTest is Test {
    ExternalFunctionPointerSelector c;

    function setUp() public {
        c = new ExternalFunctionPointerSelector();
    }

    // testYul() -> 0xe16b4a9b
    function test_testYul() public {
        assertEq(c.testYul(), 0xe16b4a9b);
    }

    // testSol() -> 0xe16b4a9b
    function test_testSol() public {
        assertEq(c.testSol(), 0xe16b4a9b);
    }
}
