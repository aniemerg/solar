// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InterfaceIdEvents.sol";

contract InterfaceIdEventsTest {
    function test_InterfaceIdEvents() public {
        InterfaceIdEvents c = new InterfaceIdEvents();
        // hello_world() -> left(0xc6be8b58)
        assert(c.hello_world() == 0xc6be8b58);
        // hello_world_with_event() -> left(0xc6be8b58)
        // Events are excluded from interfaceId computation
        assert(c.hello_world_with_event() == 0xc6be8b58);
    }
}
