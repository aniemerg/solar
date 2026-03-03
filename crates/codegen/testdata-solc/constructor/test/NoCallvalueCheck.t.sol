// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/NoCallvalueCheck.sol";

contract NoCallvalueCheckTest {
    function test_NoCallvalueCheck() public {
        NoCallvalueCheck c = new NoCallvalueCheck();
        bool result = c.f{value: 2000 ether}();
        assert(result == true);
    }

    receive() external payable {}
}
