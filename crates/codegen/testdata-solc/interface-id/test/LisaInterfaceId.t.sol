// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/LisaInterfaceId.sol";

contract LisaInterfaceIdTest {
    function test_LisaInterfaceId() public {
        LisaInterfaceId c = new LisaInterfaceId();
        // left(0x01ffc9a0) -> false
        assert(c.supportsInterface(0x01ffc9a0) == false);
        // left(0x01ffc9a7) -> true  (ERC165 supportsInterface selector)
        assert(c.supportsInterface(0x01ffc9a7) == true);
        // left(0x73b6b492) -> true  (Simpson interfaceId)
        assert(c.supportsInterface(0x73b6b492) == true);
        // left(0x70b6b492) -> false
        assert(c.supportsInterface(0x70b6b492) == false);
    }
}
