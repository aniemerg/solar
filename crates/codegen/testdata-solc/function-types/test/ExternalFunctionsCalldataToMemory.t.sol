// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ExternalFunctionsCalldataToMemory.sol";

contract ExternalFunctionsCalldataToMemoryTest {
    function test_calldataToMemoryPointer() public {
        ExternalFunctionsCalldataToMemory c = new ExternalFunctionsCalldataToMemory();
        assert(c.main() == true);
    }
}
