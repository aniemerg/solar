// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/TryCatchLowLevel.sol";

contract TryCatchLowLevelTest {
    function test_TryCatchLowLevel() public {
        TryCatchLowLevel c = new TryCatchLowLevel();
        (uint256 a, uint256 b, bytes memory txt) = c.f(true);
        assert(a == 1);
        assert(b == 2);
        assert(txt.length == 0);

        (a, b, txt) = c.f(false);
        assert(a == 0);
        assert(b == 0);
        bytes memory expected = abi.encodeWithSignature("Error(string)", "message");
        assert(keccak256(txt) == keccak256(expected));
    }
}
