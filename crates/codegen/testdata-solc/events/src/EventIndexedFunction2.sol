// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventIndexedFunction2 {
    event TestA(function() external indexed);
    event TestB(function(uint256) external indexed);
    function f1() public {
        emit TestA(EventIndexedFunction2(address(0x1234)).f1);
    }
    function f2(uint256 a) public {
        emit TestB(EventIndexedFunction2(address(0x1234)).f2);
    }
}
