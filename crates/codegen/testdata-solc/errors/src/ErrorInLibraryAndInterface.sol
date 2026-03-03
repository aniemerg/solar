// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

error E(uint a);

library L {
    error E(uint a, uint b);
}

interface I {
    error E(uint a, uint b, uint c);
}

contract ErrorInLibraryAndInterface {
    function f() public pure {
        revert E(1);
    }

    function g() public pure {
        revert L.E(1, 2);
    }

    function h() public pure {
        revert I.E(1, 2, 3);
    }
}
