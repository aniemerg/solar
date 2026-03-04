// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InlineArrayWithValueCallOption.sol";

contract InlineArrayWithValueCallOptionTest {
    function test_inlineArrayValueCall() public {
        InlineArrayWithValueCallOption c = new InlineArrayWithValueCallOption();
        // Call h with 1 ether
        uint result = c.h{value: 1 ether}();
        assert(result == 1);
    }

    receive() external payable {}
    fallback() external payable {}
}
