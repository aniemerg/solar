// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/DirtyCalldataDynamicArray.sol";

contract DirtyCalldataDynamicArrayTest {
    function test_DirtyCalldataDynamicArray() public {
        DirtyCalldataDynamicArray c = new DirtyCalldataDynamicArray();
        int16[] memory a = new int16[](2);
        a[0] = 0x7fff;
        a[1] = 0x7fff;
        assert(c.f(a));
    }
}
