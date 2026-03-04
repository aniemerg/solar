// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExternalIdentifierAccessShadowing {
    function f() public returns (uint x) {
        assembly {
            function g() -> f { f := 2 }
            x := g()
        }
    }
}
