// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

type MyInt8 is int8;

contract DirtyUint8Read {
    MyInt8 public x = MyInt8.wrap(-5);

    function create_dirty_slot() external {
        uint mask = 2**255 - 1;
        assembly {
            let value := sload(x.slot)
            sstore(x.slot, and(mask, value))
        }
    }

    function read_unclean_value() external view returns (bytes32 ret) {
        MyInt8 value = x;
        assembly {
            ret := value
        }
    }
}
