// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OptimizeMemoryStoreMultiBlockBugreport {
    uint256 x;

    function test() public returns (uint256) {
        uint256 a = myGetX();
        x = 5;
        uint256 b = myGetX();
        assembly {
            log0(0, 64)
        }
        return a + b + myGetX();
    }

    function myGetX() internal view returns (uint256) {
        assembly {
            mstore(1, 0x123456789abcdef)
        }
        return x;
    }
}
