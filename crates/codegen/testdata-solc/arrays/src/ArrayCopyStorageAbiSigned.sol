// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// NOTE: This does not really test copying from storage to ABI directly,
// because it will always copy to memory first.
contract ArrayCopyStorageAbiSigned {
    int16[] x;

    function runTest() public returns (int16[] memory) {
        x.push(int16(-1));
        x.push(int16(-1));
        x.push(int16(8));
        x.push(int16(-16));
        x.push(int16(-2));
        x.push(int16(6));
        x.push(int16(8));
        x.push(int16(-1));
        return x;
    }
}
