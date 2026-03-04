// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ModifiersInConstructionContext.sol";

contract ModifiersInConstructionContextTest {
    function test_constructor() public {
        new ModifiersInConstructionContext();
    }
}
