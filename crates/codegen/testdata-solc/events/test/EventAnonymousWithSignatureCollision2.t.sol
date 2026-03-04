// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/EventAnonymousWithSignatureCollision2.sol";

contract EventAnonymousWithSignatureCollision2Test {
    EventAnonymousWithSignatureCollision2 c;

    function setUp() public {
        c = new EventAnonymousWithSignatureCollision2();
    }

    function test_deposit() public {
        // Anonymous event with signature collision: just verify call succeeds
        bytes32 id = bytes32(uint256(0x1234));
        (bool ok,) = address(c).call{value: 18}(abi.encodeWithSignature("deposit(bytes32)", id));
        assert(ok);
    }
}
