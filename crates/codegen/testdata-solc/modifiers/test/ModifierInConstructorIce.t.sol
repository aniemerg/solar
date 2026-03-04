// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ModifierInConstructorIce.sol";

contract ModifierInConstructorIceTest {
    function test_constructor() public {
        new ModifierInConstructorIce();
    }
}
