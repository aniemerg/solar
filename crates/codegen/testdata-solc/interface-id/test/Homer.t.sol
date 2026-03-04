// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Homer.sol";

contract HomerTest {
    function test_Homer() public {
        Homer c = new Homer();
        // left(0x01ffc9a0) -> false  (wrong ERC165 id)
        assert(c.supportsInterface(0x01ffc9a0) == false);
        // left(0x01ffc9a7) -> true   (correct ERC165 id)
        assert(c.supportsInterface(0x01ffc9a7) == true);
        // left(0x73b6b492) -> true   (Simpson id)
        assert(c.supportsInterface(0x73b6b492) == true);
        // left(0x70b6b492) -> false
        assert(c.supportsInterface(0x70b6b492) == false);
    }
}
