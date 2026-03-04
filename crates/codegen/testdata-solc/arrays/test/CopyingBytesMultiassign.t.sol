// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CopyingBytesMultiassign.sol";

contract CopyingBytesMultiassignTest {
    function test_CopyingBytesMultiassign() public {
        CopyingBytesMultiassign c = new CopyingBytesMultiassign();

        // (): 7 ->  (call fallback with data = abi.encode(7))
        // This sends msg.data to the fallback which assigns savedData1 = savedData2 = msg.data
        (bool ok,) = address(c).call(abi.encode(uint(7)));
        assert(ok);

        // val() -> 0
        assert(c.val() == 0);

        // forward(bool): true -> true
        // Calls rec with savedData1 (which is abi.encode(7))
        assert(c.forward(true) == true);

        // val() -> 0x80 (because savedData1 = abi.encode(7) which doesn't match recv selector)
        assert(c.val() == 0x80);

        // forward(bool): false -> true
        assert(c.forward(false) == true);
        // val() -> 0x80
        assert(c.val() == 0x80);

        // forward(bool): true -> true (savedData1 was deleted)
        assert(c.forward(true) == true);
        // val() -> 0x80 (rec is called with empty data, which hits fallback -> received = 0x80)
        assert(c.val() == 0x80);
    }
}
