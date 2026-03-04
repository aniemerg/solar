// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/EventShadowingFileLevel.sol";

contract EventShadowingFileLevelTest {
    EventShadowingFileLevel c;

    function setUp() public {
        c = new EventShadowingFileLevel();
    }

    function test_main() public {
        (bytes32 a, bytes32 b, bytes32 cc) = c.main();
        assert(a == 0x3e9992c940c54ea252d3a34557cc3d3014281525c43d694f89d5f3dfd820b07d);
        assert(b == 0x3e9992c940c54ea252d3a34557cc3d3014281525c43d694f89d5f3dfd820b07d);
        assert(cc == 0x92bbf6e823a631f3c8e09b1c8df90f378fb56f7fbc9701827e1ff8aad7f6a028);
    }

    function test_k_main() public {
        (bytes32 a, bytes32 b, bytes32 cc) = c.k_main();
        assert(a == 0x92bbf6e823a631f3c8e09b1c8df90f378fb56f7fbc9701827e1ff8aad7f6a028);
        assert(b == 0x3e9992c940c54ea252d3a34557cc3d3014281525c43d694f89d5f3dfd820b07d);
        assert(cc == 0x92bbf6e823a631f3c8e09b1c8df90f378fb56f7fbc9701827e1ff8aad7f6a028);
    }
}
