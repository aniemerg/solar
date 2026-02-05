// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArraysInConstructors.sol";

contract ArraysInConstructorsTest {
    function makeAddresses() internal pure returns (address[] memory s) {
        s = new address[](10);
        for (uint256 i = 0; i < 10; i++) {
            s[i] = address(uint160(i + 1));
        }
    }

    function test_ArraysInConstructors() public {
        ArraysInConstructorsCreator c = new ArraysInConstructorsCreator();
        address[] memory s = makeAddresses();
        (uint256 r, address ch) = c.f(7, s);
        assert(r == 7);
        assert(ch == address(uint160(8)));
    }
}
