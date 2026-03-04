// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Arrays.sol";

contract ArraysTest {
    function test_Arrays_r() public {
        Arrays c = new Arrays();
        bool[3] memory res = c.r();
        assert(res[0] == true && res[1] == false && res[2] == true);
    }

    function test_Arrays_s() public {
        Arrays c = new Arrays();
        (uint[2] memory arr, uint val) = c.s();
        assert(arr[0] == 123 && arr[1] == 456 && val == 789);
    }

    function test_Arrays_u() public {
        Arrays c = new Arrays();
        Arrays.T[2] memory res = c.u();
        assert(res[0].a == 23 && res[0].b == 42);
        assert(keccak256(bytes(res[0].s)) == keccak256(bytes("any")));
        assert(res[1].a == 555 && res[1].b == 666);
        assert(keccak256(bytes(res[1].s)) == keccak256(bytes("any")));
    }

    function test_Arrays_v() public {
        Arrays c = new Arrays();
        bool[2][] memory res = c.v();
        assert(res.length == 0);
    }

    function test_Arrays_w1() public {
        Arrays c = new Arrays();
        string[1] memory res = c.w1();
        assert(keccak256(bytes(res[0])) == keccak256(bytes("any")));
    }

    function test_Arrays_w2() public {
        Arrays c = new Arrays();
        string[2] memory res = c.w2();
        assert(keccak256(bytes(res[0])) == keccak256(bytes("any")));
        assert(keccak256(bytes(res[1])) == keccak256(bytes("any")));
    }

    function test_Arrays_w3() public {
        Arrays c = new Arrays();
        string[3] memory res = c.w3();
        assert(keccak256(bytes(res[0])) == keccak256(bytes("any")));
        assert(keccak256(bytes(res[1])) == keccak256(bytes("any")));
        assert(keccak256(bytes(res[2])) == keccak256(bytes("any")));
    }

    function test_Arrays_x() public {
        Arrays c = new Arrays();
        (string[2] memory a2, string[3] memory a3) = c.x();
        assert(keccak256(bytes(a2[0])) == keccak256(bytes("any")));
        assert(keccak256(bytes(a2[1])) == keccak256(bytes("any")));
        assert(keccak256(bytes(a3[0])) == keccak256(bytes("any")));
        assert(keccak256(bytes(a3[1])) == keccak256(bytes("any")));
        assert(keccak256(bytes(a3[2])) == keccak256(bytes("any")));
    }
}
