// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MappingState {
    mapping(address => bool) canVote;
    mapping(address => uint256) voteCount;
    mapping(address => bool) voted;

    function getVoteCount(address addr) public view returns (uint256) {
        return voteCount[addr];
    }

    function grantVoteRight(address addr) public {
        canVote[addr] = true;
    }

    function vote(address voter, address vote) public returns (bool) {
        if (!canVote[voter] || voted[voter]) return false;
        voted[voter] = true;
        voteCount[vote] = voteCount[vote] + 1;
        return true;
    }
}
