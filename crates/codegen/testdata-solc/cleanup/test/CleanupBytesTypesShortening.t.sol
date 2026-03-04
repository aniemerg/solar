// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CleanupBytesTypesShortening.sol";

contract CleanupBytesTypesShorteningTest {
    function test_CleanupBytesTypesShortening() public {
        CleanupBytesTypesShortening c = new CleanupBytesTypesShortening();
        // bytes2(bytes4(0xffffffff)) = 0xffff
        // When read via assembly into bytes32, standard codegen preserves 4 bytes
        // yielding 0xffffffff000...000
        assert(c.f() == 0xffffffff00000000000000000000000000000000000000000000000000000000);
    }
}
