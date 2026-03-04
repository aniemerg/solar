// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/LibraryFunctionsInsideContract.sol";

contract LibraryFunctionsInsideContractTest {
    LibraryFunctionsInsideContract c;

    function setUp() public {
        c = new LibraryFunctionsInsideContract();
    }

    function test_f_g_h() public view {
        assert(c.f() == 1);
        assert(c.g() == 2);
        assert(c.h() == 3);
    }
}
