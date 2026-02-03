// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StringsInStruct {
    Buggy public bug;

    struct Buggy {
        uint256 first;
        uint256 second;
        uint256 third;
        string last;
    }

    constructor() {
        bug = Buggy(10, 20, 30, "asdfghjkl");
    }

    function getFirst() public view returns (uint256) {
        return bug.first;
    }

    function getSecond() public view returns (uint256) {
        return bug.second;
    }

    function getThird() public view returns (uint256) {
        return bug.third;
    }

    function getLast() public view returns (string memory) {
        return bug.last;
    }
}
