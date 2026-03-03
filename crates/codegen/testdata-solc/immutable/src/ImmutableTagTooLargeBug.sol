// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ImmutableTagTooLargeBug {
    int immutable x = 1;
    int immutable y = 3;

    function f() public payable returns (int, int) {
        uint a = uint(y / 1e8);
        int256 b = x * y;
        int24 c = int24(b * b >> 128);
        int24 d = int24((100 * y + 1) >> 128);
        int24 e = int24(x >> 128);
        int256 ff = x * 2;
        if (c < 0) {
            int256 g = (x * x * y) / x;
            require((y >= 0 && g <= x) || (y < 0 && (x - y) > x));
            if (b >= ff) {
                require(x <= int256(uint256(type(uint168).max)) && x >= 0, "");
                b = (b * b) / ff;
                for (a = 0; a < a; a++) {
                    uint8 bv;
                    assembly {
                        bv := and(mload(a), 0xFF)
                    }
                }
                b += ff;
            }
            require(d % e != 0);
            c = -c;
        }
        return (x, ((x * (x - y)) / (x + y)));
    }

    constructor() {
        x--;
        --x;
        y++;
        ++y;
        --y;
    }
}
