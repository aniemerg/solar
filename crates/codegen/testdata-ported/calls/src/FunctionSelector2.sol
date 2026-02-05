// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SelectorBase2 {
    function ext() external {}
    function pub() public {}
}

contract FunctionSelector2 {
    function test() public pure returns (bytes4, bytes4) {
        return (SelectorBase2.ext.selector, SelectorBase2.pub.selector);
    }
}
