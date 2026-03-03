// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataArrayIndexRangeAccess.sol";

contract CalldataArrayIndexRangeAccessTest {
    function test_CalldataArrayIndexRangeAccess() public {
        CalldataArrayIndexRangeAccess c = new CalldataArrayIndexRangeAccess();
        uint256[] memory x = new uint256[](5);
        x[0] = 1;
        x[1] = 2;
        x[2] = 3;
        x[3] = 4;
        x[4] = 5;

        assert(c.f(x, 2, 4) == 2);
        assert(c.f(x, 3, 3) == 0);
        assert(c.f(x, 0, 3) == 3);

        (bool ok, ) = address(c).call(abi.encodeWithSelector(CalldataArrayIndexRangeAccess.f.selector, x, 2, 6));
        assert(ok == false);
        (ok, ) = address(c).call(abi.encodeWithSelector(CalldataArrayIndexRangeAccess.f.selector, x, 4, 3));
        assert(ok == false);

        assert(c.f2(x, 1, 3, 1, 2) == 1);
        (ok, ) = address(c).call(
            abi.encodeWithSelector(CalldataArrayIndexRangeAccess.f2.selector, x, 1, 3, 1, 4)
        );
        assert(ok == false);

        assert(c.f_s_only(x, 2) == 3);
        (ok, ) = address(c).call(abi.encodeWithSelector(CalldataArrayIndexRangeAccess.f_s_only.selector, x, 6));
        assert(ok == false);

        assert(c.f_e_only(x, 3) == 3);
        (ok, ) = address(c).call(abi.encodeWithSelector(CalldataArrayIndexRangeAccess.f_e_only.selector, x, 6));
        assert(ok == false);

        assert(c.g(x, 2, 4, 1) == 4);
        (ok, ) = address(c).call(abi.encodeWithSelector(CalldataArrayIndexRangeAccess.g.selector, x, 2, 4, 3));
        assert(ok == false);

        assert(c.gg(x, 2, 4, 1) == 4);
        (ok, ) = address(c).call(abi.encodeWithSelector(CalldataArrayIndexRangeAccess.gg.selector, x, 2, 4, 3));
        assert(ok == false);

        assert(c.gg_s_only(x, 2, 1) == 4);
        assert(c.gg_e_only(x, 3, 1) == 2);
    }
}
