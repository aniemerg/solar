// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CopyToMapping.sol";

contract CopyToMappingTest {
    CopyToMapping c;

    function setUp() public {
        c = new CopyToMapping();
    }

    function test_CopyToMapping() public {
        CopyToMapping.S memory r1 = c.from_state();
        assert(keccak256(r1.b) == keccak256(bytes("foo")));
        assert(r1.a.length == 2 && r1.a[0] == 13 && r1.a[1] == 14);
        assert(r1.u == 21);

        CopyToMapping.S memory r2 = c.from_storage();
        assert(keccak256(r2.b) == keccak256(bytes("foo")));
        assert(r2.a.length == 2 && r2.a[0] == 13 && r2.a[1] == 14);
        assert(r2.u == 21);

        CopyToMapping.S memory r3 = c.from_memory();
        assert(keccak256(r3.b) == keccak256(bytes("foo")));
        assert(r3.a.length == 2 && r3.a[0] == 13 && r3.a[1] == 14);
        assert(r3.u == 21);

        uint16[] memory a = new uint16[](2);
        a[0] = 13;
        a[1] = 14;
        CopyToMapping.S memory sIn;
        sIn.b = bytes("foo");
        sIn.a = a;
        sIn.u = 21;
        CopyToMapping.S memory r4 = c.from_calldata(sIn);
        assert(keccak256(r4.b) == keccak256(bytes("foo")));
        assert(r4.a.length == 2 && r4.a[0] == 13 && r4.a[1] == 14);
        assert(r4.u == 21);
    }
}
