// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

struct SCalldata {
    uint256 x;
    uint256 y;
}

library LCalldata {
    function reverse(SCalldata calldata _s) internal pure returns (uint256, uint256) {
        return (_s.y, _s.x);
    }
}

contract CalldataStruct {
    function test(uint256, SCalldata calldata _s, uint256) external pure returns (uint256, uint256) {
        return LCalldata.reverse(_s);
    }
}
