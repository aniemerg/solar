// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FunctionModifier {
    function getOne() public payable nonFree returns (uint256 r) {
        return 1;
    }

    modifier nonFree {
        if (msg.value > 0) _;
    }
}
