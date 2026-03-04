// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Structs.sol";

contract StructsTest {
    function test_Structs_s() public {
        Structs c = new Structs();
        Structs.S memory res = c.s();
        assert(res.a == 23 && res.b == 42);
    }

    function test_Structs_t() public {
        Structs c = new Structs();
        Structs.T memory res = c.t();
        assert(res.a == 23 && res.b == 42);
        assert(keccak256(bytes(res.s)) == keccak256(bytes("any")));
    }
}
