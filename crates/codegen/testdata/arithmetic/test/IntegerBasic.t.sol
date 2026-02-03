// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/IntegerBasic.sol";

contract IntegerBasicTest {
    function test_IntegerBasic() public {
        IntegerBasic c = new IntegerBasic();
        assert(c.basic());
    }
}
