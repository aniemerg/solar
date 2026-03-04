// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UnaryTooLongLiteral {
    function f() public pure returns (bool) {
        return
            0 <
            ~~84926290883049832306107864558384249403874903260938453235235091622489261765859;
    }
}
