// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/VirtualOverrideChangingMutabilityPublic.sol";

contract VirtualOverrideChangingMutabilityPublicTest {
    function test_VirtualOverrideChangingMutabilityPublic() public {
        VirtualOverrideChangingMutabilityPublic c = new VirtualOverrideChangingMutabilityPublic();
        // run() ->  (no return value, just succeeds)
        c.run();
    }
}
