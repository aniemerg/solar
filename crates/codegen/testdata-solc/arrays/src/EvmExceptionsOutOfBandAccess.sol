// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EvmExceptionsOutOfBandAccess {
    uint256[3] arr;
    bool public tested = false;

    function getElement(uint256 i) public returns (uint256) {
        return arr[i];
    }

    function runTestIt() public returns (bool) {
        uint256 i = this.getElement(5);
        tested = true;
        return true;
    }
}
