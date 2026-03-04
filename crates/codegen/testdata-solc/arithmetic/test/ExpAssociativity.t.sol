// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ExpAssociativity.sol";

contract ExpAssociativityTest {
    ExpAssociativity c;

    function setUp() public {
        c = new ExpAssociativity();
    }

    function test_ExpAssociativity() public view {
        assert(c.hardcode1(2, 3, 4) == 2417851639229258349412352);
        assert(c.hardcode2(3, 2, 2, 2) == 43046721);
        assert(c.checkInvariant(2, 3, 4) == true);
        assert(c.checkInvariant(3, 4, 2) == true);
        assert(c.literalMix(2, 3) == true);
        assert(c.otherOperators(2, 4) == true);
    }
}
