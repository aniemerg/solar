// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataArray {
    function g(uint256[] calldata) external pure returns (bytes memory) {
        return msg.data;
    }
    function f(uint256[][1] calldata s) external view returns (bool) {
        bytes memory a = this.g(s[0]);
        uint256[] memory m = s[0];
        bytes memory b = this.g(m);
        assert(a.length == b.length);
        for (uint i = 0; i < a.length; i++)
            assert(a[i] == b[i]);
        return true;
    }
}
