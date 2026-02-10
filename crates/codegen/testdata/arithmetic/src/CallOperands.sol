// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @notice Exercises basic ops in CALL operands so emit_value_fresh can re-emit them.
contract CallOperandOps {
    function exercise() public {
        address target = address(0x01);
        uint256 gasBase = 100000;
        uint256 a = block.number + 100;
        uint256 b = (block.timestamp | 1);
        int256 sa = int256(block.number) - int256(block.timestamp);
        int256 sb = int256(block.timestamp | 1);
        uint256 sh = block.number & 0xff;

        target.call{gas: gasBase + (a / b)}("");
        target.call{gas: gasBase + uint256(sa / sb)}("");
        target.call{gas: gasBase + (a % b)}("");
        target.call{gas: gasBase + uint256(sa % sb)}("");
        target.call{gas: gasBase + (2 ** (a & 0x7))}("");
        target.call{gas: gasBase + addmod(a, b, 97)}("");
        target.call{gas: gasBase + mulmod(a, b, 97)}("");

        target.call{gas: gasBase + (a & b)}("");
        target.call{gas: gasBase + (a | b)}("");
        target.call{gas: gasBase + (a ^ b)}("");
        target.call{gas: gasBase + uint256(uint16(~a))}("");
        target.call{gas: gasBase + (a << (sh & 0x1f))}("");
        target.call{gas: gasBase + (a >> (sh & 0x1f))}("");
        target.call{gas: gasBase + uint256(sa >> (sh & 0x1f))}("");

        bytes32 data = keccak256(abi.encodePacked(a, b));
        target.call{gas: gasBase + uint256(uint8(data[0]))}("");

        target.call{gas: gasBase + (a < b ? 1 : 0)}("");
        target.call{gas: gasBase + (a > b ? 1 : 0)}("");
        target.call{gas: gasBase + (sa < sb ? 1 : 0)}("");
        target.call{gas: gasBase + (sa > sb ? 1 : 0)}("");
        target.call{gas: gasBase + (a == b ? 1 : 0)}("");
        target.call{gas: gasBase + (a != b ? 1 : 0)}("");
        target.call{gas: gasBase + (a == 0 ? 1 : 0)}("");
    }
}
