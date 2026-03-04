// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataDynamicallyEncoded.sol";

contract CalldataDynamicallyEncodedTest {
    CalldataDynamicallyEncoded c;

    function setUp() public {
        c = new CalldataDynamicallyEncoded();
    }

    function test_CalldataDynamicallyEncoded() public view {
        uint256[] memory a = new uint256[](2);
        a[0] = 42;
        a[1] = 23;
        CalldataDynamicallyEncoded.S memory s;
        s.a = a;
        (uint256 len, uint256 v0, uint256 v1) = c.f(s);
        assert(len == 2 && v0 == 42 && v1 == 23);
    }
}
