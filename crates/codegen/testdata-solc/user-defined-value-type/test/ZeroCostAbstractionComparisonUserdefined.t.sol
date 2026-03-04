// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ZeroCostAbstractionComparisonUserdefined.sol";

contract ZeroCostAbstractionComparisonUserdefinedTest {
    function test_userdefined() public {
        ZeroCostAbstractionComparisonUserdefined c = new ZeroCostAbstractionComparisonUserdefined();
        assert(MyInt.unwrap(c.getX()) == 0);
        c.setX(MyInt.wrap(5));
        assert(MyInt.unwrap(c.getX()) == 5);
        assert(MyInt.unwrap(c.add(MyInt.wrap(200), MyInt.wrap(99))) == 299);
    }
}
