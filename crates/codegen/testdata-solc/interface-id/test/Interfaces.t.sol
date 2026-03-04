// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Interfaces.sol";

contract InterfacesTest {
    function test_Interfaces() public {
        Interfaces c = new Interfaces();
        // hello() -> left(0x19ff1d21)
        assert(c.hello() == 0x19ff1d21);
        // world() -> left(0xdf419679)
        assert(c.world() == 0xdf419679);
        // ERC165_interfaceId() -> left(0x01ffc9a7)
        assert(c.ERC165_interfaceId() == 0x01ffc9a7);
        // hello_world() -> left(0xc6be8b58)
        assert(c.hello_world() == 0xc6be8b58);
        // hello_world_interfaceId() -> left(0xc6be8b58)
        assert(c.hello_world_interfaceId() == 0xc6be8b58);
        // ghello_world_interfaceId() -> left(0xc6be8b58)
        assert(c.ghello_world_interfaceId() == 0xc6be8b58);
        // other() -> left(0x85295877)
        assert(c.other() == 0x85295877);
        // hello_world_derived_interfaceId() -> left(0x85295877)
        assert(c.hello_world_derived_interfaceId() == 0x85295877);
    }
}
