// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CleanupAddressTypesShortening.sol";

contract CleanupAddressTypesShorteningTest {
    function test_CleanupAddressTypesShortening() public {
        CleanupAddressTypesShortening c = new CleanupAddressTypesShortening();
        assert(c.f() == 0x1122334455667788990011223344556677889900);
        assert(c.g() == 0x1122334455667788990011223344556677889900);
    }
}
