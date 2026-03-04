// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

type MyUInt16 is uint16;
type MyBytes2 is bytes2;

contract DirtySlot {
    MyUInt16 public a = MyUInt16.wrap(13);
    MyBytes2 public b = MyBytes2.wrap(bytes2(uint16(1025)));
    bytes2 public x;

    function write_a() external {
        uint max = 0xf00e0bbc0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0e0c0ba098076054032001;
        assembly {
            sstore(a.slot, max)
        }
    }
    function write_b() external {
        uint max = 0xf00e0bbc0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0e0c0ba098076054032001;
        assembly {
            sstore(b.slot, max)
        }
    }
    function get_b(uint index) public view returns (bytes1) {
        return MyBytes2.unwrap(b)[index];
    }
}
