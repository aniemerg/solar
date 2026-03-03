// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Inlined from s1.sol
error E(uint);

// s2.sol imports s1 as S; s3.sol imports both s1 directly and via s2
// All references to S.E, T.S.E, and plain E resolve to the same error E(uint)

contract ViaImport {
    function x() public pure {
        revert E(1);
    }

    // y() reverts with S.E(2) - same as E(2)
    function y() public pure {
        revert E(2);
    }

    // z() reverts with T.S.E(3) - same as E(3)
    function z() public pure {
        revert E(3);
    }
}
