// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library L {
    function pub() public pure returns (uint) {
        return 7;
    }

    function inter() internal pure returns (uint) {
        return 8;
    }
}

function fu() pure returns (uint, uint) {
    return (L.pub(), L.inter());
}

contract LibrariesFromFree {
    function f() public pure returns (uint, uint) {
        return fu();
    }
}
