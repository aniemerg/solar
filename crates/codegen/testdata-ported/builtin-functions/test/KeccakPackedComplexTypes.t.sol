// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/KeccakPackedComplexTypes.sol";

contract KeccakPackedComplexTypesTest {
    function test_KeccakPackedComplexTypes() public {
        KeccakPackedComplexTypes c = new KeccakPackedComplexTypes();
        (bytes32 h1, bytes32 h2, bytes32 h3) = c.f();
        assert(
            h1 ==
                0xba4f20407251e4607cd66b90bfea19ec6971699c03e4a4f3ea737d5818ac27ae
        );
        assert(
            h2 ==
                0xba4f20407251e4607cd66b90bfea19ec6971699c03e4a4f3ea737d5818ac27ae
        );
        assert(
            h3 ==
                0xe7490fade3a8e31113ecb6c0d2635e28a6f5ca8359a57afe914827f41ddf0848
        );
    }
}
