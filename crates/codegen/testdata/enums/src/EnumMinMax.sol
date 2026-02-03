// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EnumMinMax {
    enum MinMax { A, B, C, D }

    function min() public pure returns (uint256) { return uint256(type(MinMax).min); }
    function max() public pure returns (uint256) { return uint256(type(MinMax).max); }
}
