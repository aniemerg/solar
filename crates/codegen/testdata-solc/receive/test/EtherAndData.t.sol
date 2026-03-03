// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/EtherAndData.sol";

contract EtherAndDataTest is Test {
    EtherAndData c;

    function setUp() public {
        c = new EtherAndData();
    }

    function test_EtherAndData() public {
        (bool ok1,) = address(c).call{value: 1 ether}("");
        assert(ok1);

        (bool ok2,) = address(c).call{value: 1 ether}(hex"01");
        assert(!ok2);
    }
}
