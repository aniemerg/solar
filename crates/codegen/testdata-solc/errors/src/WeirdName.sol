// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Custom error with the name "error" - unusual identifier
error error(uint a);

contract WeirdName {
    function f() public pure {
        revert error(2);
    }
}
