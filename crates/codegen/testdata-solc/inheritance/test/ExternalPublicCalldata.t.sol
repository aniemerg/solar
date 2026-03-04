// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ExternalPublicCalldata.sol";

contract ExternalPublicCalldataTest {
    B b;

    function setUp() public {
        b = new B();
    }

    function test_ExternalPublicCalldata() public {
        uint256[] memory input = new uint256[](2);
        input[0] = 9;
        input[1] = 8;

        uint256[] memory result = b.f(input);
        assert(result.length == 2);
        assert(result[0] == 9);
        assert(result[1] == 8);

        uint256[] memory result2 = b.g(input);
        assert(result2.length == 2);
        assert(result2[0] == 9);
        assert(result2[1] == 8);
    }
}
