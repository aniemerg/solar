// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayStorageIndexZeroed {
    uint256[] storageArray;

    function testZeroedIndices(uint256 len) public {
        while (storageArray.length < len) storageArray.push();
        while (storageArray.length > len) storageArray.pop();

        for (uint256 i = 0; i < len; i++) storageArray[i] = i + 1;

        if (len > 3) {
            while (storageArray.length > 0) storageArray.pop();
            while (storageArray.length < 3) storageArray.push();

            for (uint256 i = 3; i < len; i++) {
                assembly {
                    mstore(0, storageArray.slot)
                    let pos := add(keccak256(0, 0x20), i)
                    if iszero(eq(sload(pos), 0)) { revert(0, 0) }
                }
            }
        }

        while (storageArray.length > 0) storageArray.pop();
        while (storageArray.length < len) storageArray.push();

        for (uint256 i = 0; i < len; i++) {
            require(storageArray[i] == 0);
            uint256 val = storageArray[i];
            uint256 check;
            assembly { check := iszero(val) }
            require(check == 1);
        }
    }
}
