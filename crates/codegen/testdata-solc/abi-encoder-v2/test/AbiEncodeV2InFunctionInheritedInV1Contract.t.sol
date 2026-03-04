// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/AbiEncodeV2InFunctionInheritedInV1Contract.sol";

contract AbiEncodeV2InFunctionInheritedInV1ContractTest is Test {
    C c;

    function setUp() public {
        c = new C();
    }

    function test_test() public {
        // test() -> 77
        assertEq(c.test(), 77);
    }
}
