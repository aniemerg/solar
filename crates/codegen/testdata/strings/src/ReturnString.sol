// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReturnString {
    string public s;

    function set(string calldata _s) external {
        s = _s;
    }

    function get1() public view returns (string memory r) {
        return s;
    }

    function get2() public view returns (string memory r) {
        r = s;
    }
}
