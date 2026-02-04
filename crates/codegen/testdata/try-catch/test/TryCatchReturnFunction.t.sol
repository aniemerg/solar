// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/TryCatchReturnFunction.sol";

contract TryCatchReturnFunctionTest {
    function test_TryCatchReturnFunction() public {
        TryCatchReturnFunction c = new TryCatchReturnFunction();
        (uint256 a, function() external h, uint256 b) = c.f();
        assert(a == 1);
        assert(b == 9);
        assert(h.address == address(0x1234));
        assert(h.selector == TryCatchReturnFunction.fun.selector);
    }
}
