// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExpAssociativity {
    // 2**(3**4) = 2417851639229258349412352 (right-associative)
    function hardcode1(uint a, uint b, uint c) public pure returns (uint256) {
        return a**b**c;
    }

    // 3**(2**(2**2)) = 43046721 (right-associative)
    function hardcode2(uint a, uint b, uint c, uint d) public pure returns (uint256) {
        return a**b**c**d;
    }

    function checkInvariant(uint a, uint b, uint c) public pure returns (bool) {
        return a**b**c == a**(b**c);
    }

    function literalMix(uint a, uint b) public pure returns (bool) {
        return
            (a**2**b == a**(2**b)) &&
            (2**a**b == 2**(a**b)) &&
            (a**b**2 == a**(b**2));
    }

    function otherOperators(uint a, uint b) public pure returns (bool) {
        return
            (a**b/25 == (a**b)/25) &&
            (a**b*3**b == (a**b)*(3**b)) &&
            (b**a**a/b**a**b == (b**(a**a))/(b**(a**b)));
    }
}
