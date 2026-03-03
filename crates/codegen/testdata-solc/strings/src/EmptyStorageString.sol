// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EmptyStorageString {
    string uninitializedString;
    string emptyString = "";
    string nonEmptyString = "This is a non empty string";
    string nonEmptyString2 = "Another string";
    bytes uninitializedBytes;
    bytes emptyBytes = "";
    error EmptyError(string);
    event EmptyEvent(string);

    function f() public view returns (string memory) {
        return uninitializedString;
    }

    function g() public view returns (string memory, string memory) {
        return (uninitializedString, emptyString);
    }

    function h() public view returns (string memory, string memory) {
        return (uninitializedString, nonEmptyString);
    }

    function i() public view returns (string memory, string memory) {
        return (nonEmptyString, emptyString);
    }

    function j(string calldata _s) public pure returns (string memory) {
        return _s;
    }

    function k() public returns (string memory) {
        nonEmptyString2 = "";
        return nonEmptyString2;
    }

    function l(string calldata _s) public pure returns (bytes memory) {
        return abi.encode(_s);
    }

    function m() public view returns (string memory) {
        bytes memory b = abi.encode(emptyString);
        return string(b);
    }

    function n() public view {
        revert EmptyError(uninitializedString);
    }

    function o() public {
        emit EmptyEvent(emptyString);
    }

    function p() public {
        emit EmptyEvent("");
    }

    function q() public view returns (bytes memory) {
        return uninitializedBytes;
    }

    function r() public returns (bytes memory) {
        emptyBytes = abi.encode("");
        return emptyBytes;
    }

    function s() public returns (bytes memory) {
        emptyBytes = abi.encode(uninitializedString);
        return emptyBytes;
    }

    function set(string calldata _s) public {
        nonEmptyString = _s;
    }

    function get() public view returns (string memory) {
        return nonEmptyString;
    }
}
