// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/AccessBaseStorage.sol";

contract AccessBaseStorageTest {
    Derived d;

    function setUp() public {
        d = new Derived();
    }

    function test_AccessBaseStorage() public {
        bool ok = d.setData(1, 2);
        assert(ok == true);
        assert(d.getViaBase() == 1);
        (uint256 base, uint256 derived) = d.getViaDerived();
        assert(base == 1);
        assert(derived == 2);
    }
}
