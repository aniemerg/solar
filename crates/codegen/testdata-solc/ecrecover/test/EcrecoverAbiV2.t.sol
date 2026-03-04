// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/EcrecoverAbiV2.sol";

contract EcrecoverAbiV2Test {
    function test_EcrecoverAbiV2() public {
        EcrecoverAbiV2 c = new EcrecoverAbiV2();
        // Same test vector as ecrecover.sol (abicoder v2 is default in 0.8.x)
        address result = c.a(
            0x18c547e4f7b0f325ad1e56f57e26c745b09a3e503d86e00e5255ff7f715d3d1c,
            28,
            0x73b1693892219d736caba55bdb67216e485557ea6b6af75f37096c9aa6a5a75f,
            0xeeb940b1d03b21e36b0e47e79769f095fe2ab855bd91e3a38756b7d75a9c4549
        );
        assert(result == address(0xa94f5374Fce5edBC8E2a8697C15331677e6EbF0B));
    }
}
