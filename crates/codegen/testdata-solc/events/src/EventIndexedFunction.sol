// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventIndexedFunction {
    event Test(function() external indexed);
    function f() public {
        emit Test(EventIndexedFunction(address(0x1234)).f);
    }
}
