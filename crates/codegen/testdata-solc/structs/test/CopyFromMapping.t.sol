// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CopyFromMapping.sol";

contract CopyFromMappingTest {
    CopyFromMapping c;

    function setUp() public {
        c = new CopyFromMapping();
    }

    function test_CopyFromMapping() public {
        // to_state: returns S{b:"foo", a:[13,14], u:7}
        CopyFromMapping.S memory s1 = c.to_state();
        assert(keccak256(s1.b) == keccak256(bytes("foo")));
        assert(s1.a.length == 2 && s1.a[0] == 13 && s1.a[1] == 14);
        assert(s1.u == 7);

        // to_storage: same result
        CopyFromMapping.S memory s2 = c.to_storage();
        assert(keccak256(s2.b) == keccak256(bytes("foo")));
        assert(s2.a.length == 2 && s2.a[0] == 13 && s2.a[1] == 14);
        assert(s2.u == 7);

        // to_memory: same result
        CopyFromMapping.S memory s3 = c.to_memory();
        assert(keccak256(s3.b) == keccak256(bytes("foo")));
        assert(s3.a.length == 2 && s3.a[0] == 13 && s3.a[1] == 14);
        assert(s3.u == 7);
    }
}
