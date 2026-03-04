// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AbiEncodeV2 {
    struct S {
        uint256 a;
        uint256[] b;
    }

    function f0() public pure returns (bytes memory) {
        return abi.encode();
    }

    function f1() public pure returns (bytes memory) {
        return abi.encode(1, 2);
    }

    function f2() public pure returns (bytes memory) {
        string memory x = "abc";
        return abi.encode(1, x, 2);
    }

    function f3() public pure returns (bytes memory r) {
        // test that memory is properly allocated
        string memory x = "abc";
        r = abi.encode(1, x, 2);
        bytes memory y = "def";
        require(y[0] == "d");
        y[0] = "e";
        require(y[0] == "e");
    }

    S s;

    function f4() public returns (bytes memory r) {
        string memory x = "abc";
        s.a = 7;
        s.b.push(2);
        s.b.push(3);
        r = abi.encode(1, x, s, 2);
        bytes memory y = "def";
        require(y[0] == "d");
        y[0] = "e";
        require(y[0] == "e");
    }
}
