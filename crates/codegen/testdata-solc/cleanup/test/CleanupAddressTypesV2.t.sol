// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CleanupAddressTypesV2.sol";

contract CleanupAddressTypesV2Test {
    CleanupAddressTypesV2 c;

    function setUp() public {
        c = new CleanupAddressTypesV2();
    }

    function test_CleanupAddressTypesV2_Valid() public view {
        // Exact address matches return 0
        assert(c.f(0x1234567890123456789012345678901234567890) == 0);
        assert(c.g(payable(0x1234567890123456789012345678901234567890)) == 0);
    }

    // Under ABIv2, passing an oversized address reverts due to strict validation
    function test_CleanupAddressTypesV2_OversizedAddress_f() public {
        // Encode address with extra dirty bytes - should revert under ABIv2
        bytes memory data = abi.encodeWithSelector(
            CleanupAddressTypesV2.f.selector,
            uint256(0xffff1234567890123456789012345678901234567890)
        );
        (bool success,) = address(c).call(data);
        assert(!success);
    }

    function test_CleanupAddressTypesV2_OversizedAddress_g() public {
        bytes memory data = abi.encodeWithSelector(
            CleanupAddressTypesV2.g.selector,
            uint256(0xffff1234567890123456789012345678901234567890)
        );
        (bool success,) = address(c).call(data);
        assert(!success);
    }
}
