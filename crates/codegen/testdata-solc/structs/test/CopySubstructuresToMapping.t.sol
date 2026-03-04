// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CopySubstructuresToMapping.sol";

contract CopySubstructuresToMappingTest {
    CopySubstructuresToMapping c;

    function setUp() public {
        c = new CopySubstructuresToMapping();
    }

    function test_CopySubstructuresToMapping() public {
        // from_memory: u=21
        CopySubstructuresToMapping.S memory r1 = c.from_memory();
        assert(keccak256(r1.b) == keccak256(bytes("foo")));
        assert(r1.a.length == 2 && r1.a[0] == 13 && r1.a[1] == 14);
        assert(r1.u == 21);

        // from_state: u=21
        CopySubstructuresToMapping.S memory r2 = c.from_state();
        assert(keccak256(r2.b) == keccak256(bytes("foo")));
        assert(r2.a.length == 2 && r2.a[0] == 13 && r2.a[1] == 14);
        assert(r2.u == 21);

        // from_calldata with same data
        uint16[] memory a = new uint16[](2);
        a[0] = 13;
        a[1] = 14;
        CopySubstructuresToMapping.S memory sIn;
        sIn.b = bytes("foo");
        sIn.a = a;
        sIn.u = 21;
        CopySubstructuresToMapping.S memory r3 = c.from_calldata(sIn);
        assert(keccak256(r3.b) == keccak256(bytes("foo")));
        assert(r3.a.length == 2 && r3.a[0] == 13 && r3.a[1] == 14);
        assert(r3.u == 21);
    }
}
