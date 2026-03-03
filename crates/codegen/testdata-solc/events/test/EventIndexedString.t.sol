// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/EventIndexedString.sol";

contract EventIndexedStringTest is Test {
    EventIndexedString c;

    function setUp() public {
        c = new EventIndexedString();
    }

    function test_EventIndexedString() public {
        bytes memory buf = new bytes(90);
        for (uint256 i = 0; i < 90; i++) {
            buf[i] = bytes1(uint8(i));
        }
        string memory s = string(buf);
        uint256[4] memory arr = [uint256(4), 5, 6, 7];
        vm.expectEmit(true, true, false, false);
        emit EventIndexedString.E(s, arr);
        c.deposit();
    }
}
