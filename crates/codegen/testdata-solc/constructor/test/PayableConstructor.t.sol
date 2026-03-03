// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/PayableConstructor.sol";

contract PayableConstructorTest {
    function test_PayableConstructor() public {
        // Payable constructor: deploy with value succeeds
        PayableConstructor c = new PayableConstructor{value: 27}();
        assert(address(c) != address(0));
    }

    receive() external payable {}
}
