// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExternalCallDynamicReturndata {
    function d(uint256 n) external pure returns (uint256[] memory) {
        uint256[] memory data = new uint256[](n);
        for (uint256 i = 0; i < data.length; ++i) data[i] = i;
        return data;
    }

    function dt(uint256 n) public view returns (uint256) {
        uint256[] memory data = this.d(n);
        uint256 sum = 0;
        for (uint256 i = 0; i < data.length; ++i) sum += data[i];
        return sum;
    }
}
