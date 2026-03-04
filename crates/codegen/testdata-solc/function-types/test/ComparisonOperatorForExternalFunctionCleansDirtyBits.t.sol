// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ComparisonOperatorForExternalFunctionCleansDirtyBits.sol";

contract ComparisonOperatorForExternalFunctionCleansDirtyBitsTest {
    function test_dirtyBitsCleaned() public {
        ComparisonOperatorForExternalFunctionCleansDirtyBits c = new ComparisonOperatorForExternalFunctionCleansDirtyBits();
        assert(c.comparison_operators_for_external_function_pointers_with_dirty_bits() == true);
    }
}
