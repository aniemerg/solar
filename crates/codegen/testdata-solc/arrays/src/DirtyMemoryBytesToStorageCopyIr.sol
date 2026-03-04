// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DirtyMemoryBytesToStorageCopyIr {
    bytes x;
    function f() public returns (uint r) {
        bytes memory m = "tmp";
        assembly {
            mstore(m, 8)
            mstore(add(m, 32), "deadbeef15dead")
        }
        x = m;
        assembly {
            r := sload(x.slot)
        }
    }
}
