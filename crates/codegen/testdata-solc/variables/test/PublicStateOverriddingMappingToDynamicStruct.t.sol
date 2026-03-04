// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/PublicStateOverriddingMappingToDynamicStruct.sol";

contract PublicStateOverriddingMappingToDynamicStructTest {
    function test_PublicStateOverriddingMappingToDynamicStruct() public {
        PublicStateOverriddingMappingToDynamicStruct c = new PublicStateOverriddingMappingToDynamicStruct();
        // Before set: all zero/empty
        (uint256 v0, string memory s0) = c.test(0);
        assert(v0 == 0);
        assert(bytes(s0).length == 0);

        (uint256 v42before, string memory s42before) = c.test(42);
        assert(v42before == 0);
        assert(bytes(s42before).length == 0);

        c.set();

        // Index 0 still zero
        (uint256 v0after, string memory s0after) = c.test(0);
        assert(v0after == 0);
        assert(bytes(s0after).length == 0);

        // Index 42 now set
        (uint256 v42after, string memory s42after) = c.test(42);
        assert(v42after == 2);
        assert(keccak256(bytes(s42after)) == keccak256(bytes("statevar")));
    }
}
