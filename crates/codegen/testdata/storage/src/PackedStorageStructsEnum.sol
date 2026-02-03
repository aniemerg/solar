// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PackedStorageStructsEnum {
    enum Small { A, B, C, D }
    enum Larger { A, B, C, D, E }

    struct Str {
        Small a;
        Small b;
        Larger c;
        Larger d;
    }

    Str data;

    function test() public returns (uint256) {
        data.a = Small.B;
        if (data.a != Small.B) return 2;
        data.b = Small.C;
        if (data.b != Small.C) return 3;
        data.c = Larger.D;
        if (data.c != Larger.D) return 4;
        if (data.a != Small.B) return 5;
        data.a = Small.C;
        if (data.a != Small.C) return 6;
        if (data.b != Small.C) return 7;
        data.b = Small.D;
        if (data.b != Small.D) return 8;
        if (data.c != Larger.D) return 9;
        data.c = Larger.B;
        if (data.c != Larger.B) return 10;
        return 1;
    }
}
