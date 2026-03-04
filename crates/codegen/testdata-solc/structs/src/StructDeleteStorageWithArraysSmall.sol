// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StructDeleteStorageWithArraysSmall {
    struct S {
        uint32 a;
        uint32[3] b;
        uint32[] x;
    }
    S s;

    function f() public returns (uint32 ra, uint32 rb0, uint32 rb1, uint256 rxlen) {
        assembly {
            // 2 ** 150 - 1
            sstore(s.slot, 1427247692705959881058285969449495136382746623)
        }
        s.a = 1;
        s.b[0] = 2;
        s.b[1] = 3;
        s.x.push(4);
        s.x.push(5);
        delete s;
        ra = s.a;
        rb0 = s.b[0];
        rb1 = s.b[1];
        rxlen = s.x.length;
    }
}
