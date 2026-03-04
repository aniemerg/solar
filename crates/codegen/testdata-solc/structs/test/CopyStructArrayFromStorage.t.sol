// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CopyStructArrayFromStorage.sol";

contract CopyStructArrayFromStorageTest {
    CopyStructArrayFromStorage c;

    function setUp() public {
        c = new CopyStructArrayFromStorage();
    }

    function test_CopyStructArrayFromStorage() public {
        assert(c.run1() == true);
        assert(c.run2() == true);
        assert(c.run3() == true);
        assert(c.run4() == true);
    }
}
