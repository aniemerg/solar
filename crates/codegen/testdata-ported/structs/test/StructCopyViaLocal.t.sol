// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StructCopyViaLocal.sol";

contract StructCopyViaLocalTest {
    StructCopyViaLocal c;

    function setUp() public {
        c = new StructCopyViaLocal();
    }

    function test_StructCopyViaLocal() public {
        assert(c.test() == true);
    }
}
