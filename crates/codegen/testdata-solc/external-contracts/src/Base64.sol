// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library InlineAsmBase64 {
    string internal constant _TABLE = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

    function encode(bytes memory data) internal pure returns (string memory) {
        if (data.length == 0) return "";

        string memory table = _TABLE;

        uint256 encodedLen = 4 * ((data.length + 2) / 3);

        string memory result = new string(encodedLen);

        assembly {
            mstore(result, encodedLen)

            let tablePtr := add(table, 1)

            let dataPtr := data
            let endPtr := add(dataPtr, mload(data))

            let resultPtr := add(result, 32)

            for {

            } lt(dataPtr, endPtr) {

            } {
                dataPtr := add(dataPtr, 3)
                let input := mload(dataPtr)

                mstore8(resultPtr, mload(add(tablePtr, and(shr(18, input), 0x3F))))
                resultPtr := add(resultPtr, 1)

                mstore8(resultPtr, mload(add(tablePtr, and(shr(12, input), 0x3F))))
                resultPtr := add(resultPtr, 1)

                mstore8(resultPtr, mload(add(tablePtr, and(shr(6, input), 0x3F))))
                resultPtr := add(resultPtr, 1)

                mstore8(resultPtr, mload(add(tablePtr, and(input, 0x3F))))
                resultPtr := add(resultPtr, 1)
            }

            switch mod(mload(data), 3)
            case 1 {
                mstore8(sub(resultPtr, 1), 0x3d)
                mstore8(sub(resultPtr, 2), 0x3d)
            }
            case 2 {
                mstore8(sub(resultPtr, 1), 0x3d)
            }
        }

        return result;
    }
}

library NoAsmBase64 {
    bytes private constant TABLE = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

    function encode(bytes memory data) internal pure returns (string memory) {
        if (data.length == 0) return "";

        bytes memory table     = TABLE;
        bytes memory result    = new bytes(4 * ((data.length + 2) / 3));
        uint256      resultPtr = 0;

        for (uint256 dataPtr = 0; dataPtr < data.length; dataPtr += 3) {
            uint24 chunk = (                            (uint24(uint8(data[dataPtr + 0])) << 16))
                         + (dataPtr + 1 < data.length ? (uint24(uint8(data[dataPtr + 1])) <<  8) : 0)
                         + (dataPtr + 2 < data.length ? (uint24(uint8(data[dataPtr + 2]))      ) : 0);

            result[resultPtr++] = table[uint8(chunk >> 18) & 0x3f];
            result[resultPtr++] = table[uint8(chunk >> 12) & 0x3f];
            result[resultPtr++] = table[uint8(chunk >>  6) & 0x3f];
            result[resultPtr++] = table[uint8(chunk      ) & 0x3f];
        }

        if (data.length % 3 == 1) {
            result[--resultPtr] = 0x3d;
            result[--resultPtr] = 0x3d;
        }
        else if (data.length % 3 == 2) {
            result[--resultPtr] = 0x3d;
        }

        return (string(result));
    }
}

contract Base64 {
    function encode_inline_asm(bytes memory data) external pure returns (string memory) {
        return InlineAsmBase64.encode(data);
    }

    function encode_no_asm(bytes memory data) external pure returns (string memory) {
        return NoAsmBase64.encode(data);
    }
}
