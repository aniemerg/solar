// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/LibraryOnInterface.sol";

contract LibraryOnInterfaceTest {
    LibraryOnInterface c;

    function setUp() public {
        c = new LibraryOnInterface();
    }

    function test_x() public view {
        assert(c.x() == 7);
    }
}
