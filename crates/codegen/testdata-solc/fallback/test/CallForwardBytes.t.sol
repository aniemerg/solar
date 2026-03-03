// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CallForwardBytes.sol";

contract CallForwardBytesTest {
    function test_CallForwardBytes() public {
        CallForwardBytes c = new CallForwardBytes();

        // Call recv(uint256): 7 on the sender's fallback, saving calldata
        bytes memory recvCall = abi.encodeWithSignature("recv(uint256)", uint256(7));
        address(c).call(recvCall);

        // val() should be 0 because we called sender, not receiver
        assert(c.val() == 0);

        // forward() replays savedData to receiver: recv(7) -> received += 8 -> 8
        bool ok = c.forward();
        assert(ok);
        assert(c.val() == 8);

        // clear() resets savedData
        bool ok2 = c.clear();
        assert(ok2);

        // val() still 8 after clear (no forward happened)
        assert(c.val() == 8);

        // forward() again with empty savedData -> calls receiver fallback -> received = 0x80
        c.forward();
        assert(c.val() == 0x80);
    }
}
