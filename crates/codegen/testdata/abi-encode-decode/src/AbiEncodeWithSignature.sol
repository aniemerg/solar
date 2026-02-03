// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v1;

contract AbiEncodeWithSignature {
    function f0() public pure returns (bytes memory) {
        return abi.encodeWithSignature("f(uint256)");
    }

    function f1() public pure returns (bytes memory) {
        string memory x = "f(uint256)";
        return abi.encodeWithSignature(x, "abc");
    }

    string xstor;

    function f1s() public returns (bytes memory) {
        xstor = "f(uint256)";
        return abi.encodeWithSignature(xstor, "abc");
    }
}
