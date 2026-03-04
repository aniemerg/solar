// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExternalFunctionPointerSelector {
    function testFunction() external {}

    function testYul() public returns (uint32) {
        function() external fp = this.testFunction;
        uint selectorValue = 0;

        assembly {
            selectorValue := fp.selector
        }

        // Value is right-aligned, we shift it so it can be compared
        return uint32(bytes4(bytes32(selectorValue << (256 - 32))));
    }
    function testSol() public returns (uint32) {
        return uint32(this.testFunction.selector);
    }
}
