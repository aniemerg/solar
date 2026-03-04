// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Conversion.sol";
import {Test} from "forge-std/Test.sol";

contract ConversionTest is Test {
    Conversion c;

    function setUp() public {
        c = new Conversion();
    }

    function test_f() public {
        assert(MyUInt8.unwrap(c.f(1)) == 1);
        assert(MyUInt8.unwrap(c.f(2)) == 2);
        assert(MyUInt8.unwrap(c.f(257)) == 1); // truncates to uint8
    }

    function test_g() public {
        assert(MyInt8.unwrap(c.g(1)) == 1);
        assert(MyInt8.unwrap(c.g(2)) == 2);
        assert(MyInt8.unwrap(c.g(255)) == -1);
        assert(MyInt8.unwrap(c.g(257)) == 1);
    }

    function test_h() public {
        assert(MyInt8.unwrap(c.h(MyUInt8.wrap(1))) == 1);
        assert(MyInt8.unwrap(c.h(MyUInt8.wrap(2))) == 2);
        assert(MyInt8.unwrap(c.h(MyUInt8.wrap(255))) == -1);
    }

    function test_i() public {
        assert(MyUInt16.unwrap(c.i(MyUInt8.wrap(250))) == 250);
    }

    function test_j() public {
        assert(c.j(MyUInt8.wrap(1)) == 1);
        assert(c.j(MyUInt8.wrap(2)) == 2);
        assert(c.j(MyUInt8.wrap(255)) == 0xff);
    }

    function test_k() public {
        assert(MyUInt16.unwrap(c.k(MyUInt8.wrap(1))) == 1);
        assert(MyUInt16.unwrap(c.k(MyUInt8.wrap(2))) == 2);
        assert(MyUInt16.unwrap(c.k(MyUInt8.wrap(255))) == 0xff);
    }

    function test_m() public {
        assert(MyUInt8.unwrap(c.m(MyUInt16.wrap(1))) == 1);
        assert(MyUInt8.unwrap(c.m(MyUInt16.wrap(2))) == 2);
        assert(MyUInt8.unwrap(c.m(MyUInt16.wrap(255))) == 0xff);
        assert(MyUInt8.unwrap(c.m(MyUInt16.wrap(257))) == 1);
    }
}
