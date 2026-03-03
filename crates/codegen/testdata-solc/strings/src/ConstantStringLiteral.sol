// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConstantStringLiteral {
    bytes32 constant public b = "abcdefghijklmnopq";
    string constant public x = "abefghijklmnopqabcdefghijklmnopqabcdefghijklmnopqabca";

    constructor() {
        string memory xx = x;
        bytes32 bb = b;
        xx;
        bb;
    }

    function getB() public pure returns (bytes32) {
        return b;
    }

    function getX() public pure returns (string memory) {
        return x;
    }

    function getX2() public pure returns (string memory r) {
        r = x;
    }

    function unused() public pure returns (uint256) {
        "unusedunusedunusedunusedunusedunusedunusedunusedunusedunusedunusedunused";
        return 2;
    }
}
