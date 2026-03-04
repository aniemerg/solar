// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/VirtualOverrideChangingMutabilityInternal.sol";

contract VirtualOverrideChangingMutabilityInternalTest {
    function test_VirtualOverrideChangingMutabilityInternal() public {
        VirtualOverrideChangingMutabilityInternal c = new VirtualOverrideChangingMutabilityInternal();
        // run() ->  (no return value, just succeeds)
        c.run();
    }
}
