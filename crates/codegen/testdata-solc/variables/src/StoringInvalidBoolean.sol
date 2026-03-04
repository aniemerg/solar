// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StoringInvalidBoolean {
    event Ev(bool);
    bool public perm;
    function set() public returns (uint) {
        bool tmp;
        assembly {
            tmp := 5
        }
        perm = tmp;
        return 1;
    }
    function ret() public pure returns (bool) {
        bool tmp;
        assembly {
            tmp := 5
        }
        return tmp;
    }
    function ev() public returns (uint) {
        bool tmp;
        assembly {
            tmp := 5
        }
        emit Ev(tmp);
        return 1;
    }
}
