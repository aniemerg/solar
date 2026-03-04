// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FixedPointUdvtWithOperators.sol";

contract FixedPointUdvtWithOperatorsTest {
    function test_FixedPointUdvtWithOperators() public {
        C c = new C();
        Fixed result = c.applyInterest(Fixed.wrap(500000000000000000000), Fixed.wrap(100000000000000000));
        assert(Fixed.unwrap(result) == 550000000000000000000);
    }
}
