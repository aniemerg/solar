// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/TernaryContractInternalFunction.sol";

contract TernaryContractInternalFunctionTest {
    function test_ternaryInternalFunction() public {
        TernaryContractInternalFunction c = new TernaryContractInternalFunction();
        assert(c.run(true) == 1);
        assert(c.run(false) == 2);
    }
}
