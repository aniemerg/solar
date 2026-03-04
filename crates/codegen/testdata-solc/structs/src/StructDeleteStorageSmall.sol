// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StructDeleteStorageSmall {
    struct S {
        uint64 y;
        uint64 z;
    }
    S s;

    function f() public returns (uint64 ry, uint64 rz) {
        assembly {
            // 2 ** 150 - 1
            sstore(s.slot, 1427247692705959881058285969449495136382746623)
        }
        s.y = 1;
        s.z = 2;
        delete s;
        ry = s.y;
        rz = s.z;
    }
}
