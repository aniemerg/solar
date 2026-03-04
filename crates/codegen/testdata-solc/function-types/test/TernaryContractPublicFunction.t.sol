// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/TernaryContractPublicFunction.sol";

contract TernaryContractPublicFunctionTest {
    function test_ternaryPublicFunction() public {
        TernaryContractPublicFunction c = new TernaryContractPublicFunction();
        assert(c.run(true) == 1);
        assert(c.run(false) == 2);
    }
}
