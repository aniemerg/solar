// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/TernaryContractLibraryInternalFunction.sol";

contract TernaryContractLibraryInternalFunctionTest {
    function test_ternaryLibraryInternal() public {
        TernaryContractLibraryInternalFunction c = new TernaryContractLibraryInternalFunction();
        assert(c.run(true) == 1);
        assert(c.run(false) == 2);
    }
}
