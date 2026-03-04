// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InlineAssemblyMemoryAccess {
    function test() public returns (bytes memory) {
        bytes memory x = new bytes(5);
        for (uint256 i = 0; i < x.length; ++i) x[i] = bytes1(uint8(i + 1));
        assembly {
            mstore(add(x, 32), "12345678901234567890123456789012")
        }
        return x;
    }
}
