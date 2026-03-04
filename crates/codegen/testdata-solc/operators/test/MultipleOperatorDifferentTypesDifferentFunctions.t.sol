// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MultipleOperatorDifferentTypesDifferentFunctions.sol";

contract MultipleOperatorDifferentTypesDifferentFunctionsTest {
    function test_MultipleOperatorDifferentTypesDifferentFunctions() public {
        C c = new C();
        assert(SmallInt.unwrap(c.small()) == 3);
        assert(BigInt.unwrap(c.big()) == 70);
    }
}
