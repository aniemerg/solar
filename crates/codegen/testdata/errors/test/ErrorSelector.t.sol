// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ErrorSelector.sol";

contract ErrorSelectorTest {
    ErrorSelector c;

    function setUp() public {
        c = new ErrorSelector();
    }

    function test_ErrorSelector() public view {
        (bytes4 a, bytes4 b, bytes4 d, bytes4 e) = c.test1();
        assert(a == d);
        assert(a == e);
        assert(a != b);

        (bytes4 s1, bytes4 s2, bytes4 s3, bytes4 s4) = c.test2();
        assert(s1 == a && s2 == b && s3 == a && s4 == a);

        bytes4 fsel = c.test3();
        assert(fsel == bytes4(keccak256("F()")));
    }
}
