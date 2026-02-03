// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SelectorBase {
    function ext() external {}
    function pub() public {}
}

contract FunctionSelector1 is SelectorBase {
    function test() public view returns (bytes4, bytes4, bytes4, bytes4) {
        return (SelectorBase.ext.selector, SelectorBase.pub.selector, this.ext.selector, pub.selector);
    }
}
