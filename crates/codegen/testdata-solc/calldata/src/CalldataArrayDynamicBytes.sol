// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataArrayDynamicBytes {
    function f1(bytes[1] calldata a)
        external
        pure
        returns (uint256, uint256, uint256, uint256)
    {
        return (a[0].length, uint8(a[0][0]), uint8(a[0][1]), uint8(a[0][2]));
    }

    function f2(bytes[1] calldata a, bytes[1] calldata b)
        external
        pure
        returns (uint256, uint256, uint256, uint256, uint256, uint256, uint256)
    {
        return (
            a[0].length,
            uint8(a[0][0]),
            uint8(a[0][1]),
            uint8(a[0][2]),
            b[0].length,
            uint8(b[0][0]),
            uint8(b[0][1])
        );
    }

    function g1(bytes[2] calldata a)
        external
        pure
        returns (uint256, uint256, uint256, uint256, uint256, uint256, uint256, uint256)
    {
        return (
            a[0].length,
            uint8(a[0][0]),
            uint8(a[0][1]),
            uint8(a[0][2]),
            a[1].length,
            uint8(a[1][0]),
            uint8(a[1][1]),
            uint8(a[1][2])
        );
    }

    function g2(bytes[] calldata a) external pure returns (uint256[8] memory) {
        return [
            a.length,
            a[0].length,
            uint8(a[0][0]),
            uint8(a[0][1]),
            a[1].length,
            uint8(a[1][0]),
            uint8(a[1][1]),
            uint8(a[1][2])
        ];
    }
}
