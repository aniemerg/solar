// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/DenominationsInArraySizes.sol";

contract DenominationsInArraySizesTest {
    function test_lengths() public {
        DenominationsInArraySizes c = new DenominationsInArraySizes();
        (uint la, uint lb, uint lc, uint ld, uint le, uint lf, uint lg, uint lh) = c.lengths();
        // 2 wei = 2
        assert(la == 2);
        // 2 gwei = 2 * 1e9
        assert(lb == 2000000000);
        // 2 ether = 2 * 1e18
        assert(lc == 2000000000000000000);
        // 2 seconds = 2
        assert(ld == 2);
        // 2 minutes = 120
        assert(le == 120);
        // 2 hours = 7200
        assert(lf == 7200);
        // 2 days = 172800
        assert(lg == 172800);
        // 2 weeks = 1209600
        assert(lh == 1209600);
    }
}
