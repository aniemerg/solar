// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ComparisonOperatorsForExternalFunctions.sol";

contract ComparisonOperatorsForExternalFunctionsTest {
    function test_externalFunctionComparisons() public {
        ComparisonOperatorsForExternalFunctions c = new ComparisonOperatorsForExternalFunctions();
        assert(c.comparison_operators_for_external_functions() == true);
        assert(c.comparison_operators_for_local_external_function_pointers() == true);
    }
}
