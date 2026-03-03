// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CopyFromCalldataRemovesBytesData.sol";

contract CopyFromCalldataRemovesBytesDataTest {
    CopyFromCalldataRemovesBytesData c;

    function setUp() public {
        c = new CopyFromCalldataRemovesBytesData();
    }

    function test_CopyFromCalldataRemovesBytesData() public {
        // Trigger fallback with some data (1,2,3,4,5 as in original test)
        (bool ok,) = address(c).call(abi.encodePacked(bytes1(0x01), bytes1(0x02), bytes1(0x03), bytes1(0x04), bytes1(0x05)));
        assert(ok);

        // Data should NOT be empty after fallback set it
        assert(!c.checkIfDataIsEmpty());

        // sendMessage sends empty data via call, which triggers fallback with empty calldata
        (bool success, bytes memory ret) = c.sendMessage();
        assert(success);
        assert(ret.length == 0);

        // After sending empty calldata, data should now be empty
        assert(c.checkIfDataIsEmpty());
    }
}
