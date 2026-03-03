// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

struct SAttached {
    uint256 x;
    uint256 y;
}

library LAttached {
    function reverse(SAttached calldata _s) internal pure returns (uint256, uint256) {
        return (_s.y, _s.x);
    }
}

contract CalldataAttachedToStruct {
    using LAttached for SAttached;

    function test(uint256, SAttached calldata _s, uint256) external pure returns (uint256, uint256) {
        return _s.reverse();
    }
}
