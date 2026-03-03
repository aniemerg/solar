// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StructStoragePushZeroValue.sol";

contract StructStoragePushZeroValueTest {
    StructStoragePushZeroValue c;

    function setUp() public {
        c = new StructStoragePushZeroValue();
    }

    function test_StructStoragePushZeroValue() public {
        c.f();
    }
}
