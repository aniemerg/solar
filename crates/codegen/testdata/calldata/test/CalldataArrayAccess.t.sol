// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataArrayAccess.sol";

contract CalldataArrayAccessTest {
    function test_CalldataArrayAccess_1d() public {
        CalldataArrayAccess c = new CalldataArrayAccess();
        uint256[] memory two = new uint256[](2);
        two[0] = 23;
        two[1] = 42;
        assert(c.get1(two, 0) == 23);
        assert(c.get1(two, 1) == 42);

        (bool ok, ) = address(c).call(abi.encodeWithSelector(CalldataArrayAccess.get1.selector, two, 2));
        assert(ok == false);
    }

    function test_CalldataArrayAccess_2d() public {
        CalldataArrayAccess c = new CalldataArrayAccess();
        uint256[][] memory two = new uint256[][](1);
        two[0] = new uint256[](1);
        two[0][0] = 23;
        assert(c.get2(two, 0, 0) == 23);

        (bool ok, ) = address(c).call(abi.encodeWithSelector(CalldataArrayAccess.get2.selector, two, 0, 1));
        assert(ok == false);
    }
}
