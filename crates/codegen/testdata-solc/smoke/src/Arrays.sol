// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

contract Arrays {
    struct T {
        uint a;
        uint b;
        string s;
    }

    bool[2][] flags;

    function r() public pure returns (bool[3] memory) {
        return [true, false, true];
    }

    function s() public pure returns (uint[2] memory, uint) {
        return ([uint(123), 456], 789);
    }

    function u() public pure returns (T[2] memory) {
        return [T(23, 42, "any"), T(555, 666, "any")];
    }

    function v() public view returns (bool[2][] memory) {
        return flags;
    }

    function w1() public pure returns (string[1] memory) {
        return ["any"];
    }

    function w2() public pure returns (string[2] memory) {
        return ["any", "any"];
    }

    function w3() public pure returns (string[3] memory) {
        return ["any", "any", "any"];
    }

    function x() public pure returns (string[2] memory, string[3] memory) {
        return (["any", "any"], ["any", "any", "any"]);
    }
}
