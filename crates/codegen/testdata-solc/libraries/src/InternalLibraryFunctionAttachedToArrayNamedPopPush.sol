// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LArrayPopPush {
    function pop(uint256[2] memory) internal pure {}
    function push(uint256[2] memory) internal pure {}
}

contract InternalLibraryFunctionAttachedToArrayNamedPopPush {
    using LArrayPopPush for uint256[2];

    function test() public pure {
        uint256[2] memory input;
        input.push();
        input.pop();
    }
}
