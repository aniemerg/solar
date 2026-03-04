// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/Fallback.sol";

contract FallbackTest is Test {
    Fallback c;

    function setUp() public {
        c = new Fallback();
        vm.deal(address(this), 10 ether);
    }

    function test_Fallback() public {
        assert(c.data() == 0);

        // () call triggers fallback
        (bool ok1,) = address(c).call("");
        assert(ok1);
        assert(c.data() == 1);

        // (): hex"42ef"
        (bool ok2,) = address(c).call(hex"42ef");
        assert(ok2);
        assert(c.data() == 2);
        bytes memory ext = c.externalData();
        assert(ext.length == 2 && ext[0] == 0x42 && ext[1] == 0xef);

        // balance before: 0
        assert(c.balance() == 0);

        // (), 1 wei
        (bool ok3,) = address(c).call{value: 1}("");
        assert(ok3);
        assert(c.balance() == 1);

        // (), 2 wei: hex"fefe"
        (bool ok4,) = address(c).call{value: 2}(hex"fefe");
        assert(ok4);
        assert(c.balance() == 2);
        bytes memory ext2 = c.externalData();
        assert(ext2.length == 2 && ext2[0] == 0xfe && ext2[1] == 0xfe);
    }
}
