// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StructDeleteStorageNestedSmall {
    struct S {
        uint32 a;
        S[] x;
    }
    S s;

    function f() public returns (uint32 ra, uint256 rxlen) {
        assembly {
            // 2 ** 150 - 1
            sstore(s.slot, 1427247692705959881058285969449495136382746623)
        }
        s.a = 1;
        s.x.push();
        s.x.push();
        S storage ptr1 = s.x[0];
        S storage ptr2 = s.x[1];
        assembly {
            // 2 ** 150 - 1
            sstore(ptr1.slot, 1427247692705959881058285969449495136382746623)
            sstore(ptr2.slot, 1427247692705959881058285969449495136382746623)
        }
        s.x[0].a = 2;
        s.x[1].a = 3;
        delete s;
        ra = s.a;
        rxlen = s.x.length;
    }
}
