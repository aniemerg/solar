// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodeAccessPaddingD {
    function f() public pure returns (uint256) {
        return 7;
    }
}

contract CodeAccessPadding {
    function diff() public pure returns (uint256 remainder) {
        bytes memory a = type(CodeAccessPaddingD).creationCode;
        bytes memory b = type(CodeAccessPaddingD).runtimeCode;
        assembly {
            remainder := mod(sub(b, a), 0x20)
        }
    }
}
