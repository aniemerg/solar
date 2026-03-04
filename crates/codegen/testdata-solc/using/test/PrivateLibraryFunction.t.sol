// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/PrivateLibraryFunction.sol";

contract PrivateLibraryFunctionTest {
    function test_f() public pure {
        assert(PrivateLibraryFunction.f() == 2);
    }
}
