// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Cleanup.sol";
import {Test} from "forge-std/Test.sol";

contract CleanupTest is Test {
    Cleanup c;

    function setUp() public {
        c = new Cleanup();
    }

    function test_ret() public {
        // ABI encoder cleans: 0x1ff -> 0xff
        assert(MyUInt8.unwrap(c.ret()) == 0xff);
    }

    function test_f_clean() public {
        assert(MyUInt8.unwrap(c.f(MyUInt8.wrap(0xff))) == 0xff);
    }

    function test_mem() public {
        MyUInt8[] memory x = c.mem();
        assert(x.length == 2);
        assert(MyUInt8.unwrap(x[0]) == 0xff);
        assert(MyUInt8.unwrap(x[1]) == 0xff);
    }

    function test_stor() public {
        (uint8 _a, MyUInt8 _b, uint8 _cc) = c.stor();
        assert(_a == 1);
        assert(MyUInt8.unwrap(_b) == 0xff);
        assert(_cc == 2);
    }
}
