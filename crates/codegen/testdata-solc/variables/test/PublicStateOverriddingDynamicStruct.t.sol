// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/PublicStateOverriddingDynamicStruct.sol";

contract PublicStateOverriddingDynamicStructTest {
    function test_PublicStateOverriddingDynamicStruct() public {
        PublicStateOverriddingDynamicStruct c = new PublicStateOverriddingDynamicStruct();
        // Initially: v=0, s=""
        (uint256 v0, string memory s0) = c.test();
        assert(v0 == 0);
        assert(bytes(s0).length == 0);

        c.set();
        // After set: v=2, s="statevar"
        (uint256 v1, string memory s1) = c.test();
        assert(v1 == 2);
        assert(keccak256(bytes(s1)) == keccak256(bytes("statevar")));
    }
}
