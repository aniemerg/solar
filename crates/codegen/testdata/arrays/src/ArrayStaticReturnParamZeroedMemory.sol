// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayStaticReturnParamZeroedMemory {
    mapping(string => uint256) map;

    function set(
        string memory s
    )
        public
        returns (
            uint256[3] memory x,
            uint256[2] memory y,
            uint256[] memory z,
            uint256 t
        )
    {
        map[s] = 0;
    }
}
