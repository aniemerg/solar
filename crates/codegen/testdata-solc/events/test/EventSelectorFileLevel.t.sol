// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/EventSelectorFileLevel.sol";

contract EventSelectorFileLevelTest {
    EventSelectorFileLevel c;

    function setUp() public {
        c = new EventSelectorFileLevel();
    }

    function test_main() public {
        (bytes32 a, bytes32 b) = c.main();
        assert(a == 0x92bbf6e823a631f3c8e09b1c8df90f378fb56f7fbc9701827e1ff8aad7f6a028);
        assert(b == 0x92bbf6e823a631f3c8e09b1c8df90f378fb56f7fbc9701827e1ff8aad7f6a028);
    }
}
