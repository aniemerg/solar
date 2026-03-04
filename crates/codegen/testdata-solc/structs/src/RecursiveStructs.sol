// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RecursiveStructs {
    struct S {
        S[] x;
    }
    S sstorage;

    function f() public returns (uint256) {
        S memory s;
        s.x = new S[](10);
        delete s;
        delete sstorage;
        return 1;
    }
}
