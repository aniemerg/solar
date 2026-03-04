// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Test for a bug where we did not increment the counter properly while deleting a dynamic array.
contract DeleteOnArrayOfStructs {
    struct S {
        uint256 x;
        uint256[] y;
    }
    S[] data;

    function f() public returns (bool) {
        S storage s1 = data.push();
        s1.x = 2**200;
        S storage s2 = data.push();
        s2.x = 2**200;
        delete data;
        return true;
    }
}
