// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract B {}

contract SaltedCreate {
    function different_salt() public returns (bool) {
        B x = new B{salt: "abc"}();
        B y = new B{salt: "abcef"}();
        return x != y;
    }

    function same_salt() public returns (bool) {
        B x = new B{salt: "xyz"}();
        try new B{salt: "xyz"}() {} catch {
            return true;
        }
        return false;
    }
}
